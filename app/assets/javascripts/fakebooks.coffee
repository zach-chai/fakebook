# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  populate = (data) ->
    $("#songs tr").remove()
    for song in data
      $("#songs").append "
      <tr>
        <td>#{song.bookcode}</td>
        <td>#{song.page}</td>
        <td>#{song.title}</td>
        <td><a href='/songs/#{song.id}/edit'>edit</a></td>
        <td><a href='/songs/#{song.id}/delete'>delete</a></td>
      </tr>"

  $(".book").click ->
    book = $(this).data 'book'
    $("tr").removeClass 'selected'
    $("tr.#{book}").addClass 'selected'
    $.get "/songs.json?bookcode=#{book}"
    .done (data) ->
      populate data

  $(".search").click ->
    book = $("tr.selected").data('book') || ""
    title = $("#search-box").val()
    $("tr").removeClass 'selected'
    if book || title
      $.get "/songs.json?title=#{title}&bookcode=#{book}"
      .done (data) ->
        populate data
