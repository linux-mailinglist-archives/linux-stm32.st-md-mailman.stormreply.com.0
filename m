Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF6862A06
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Feb 2024 11:55:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07636C6B46B;
	Sun, 25 Feb 2024 10:55:56 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 398F5C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Feb 2024 10:55:55 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1708858554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tAhOjFXIG9xCvbOQNJwE8wF0tLY2hpMIdA10BdIDOfo=;
 b=qX6G+1VHkEsDsE9ouyrQVD2pczeGb3IdO3iIS7gu9YZ4xRGlH4zdEqBd45v0TxaIxcdH4O
 zKFwI3wa2gZc8WeunwG4DhsmP82g7pSqNOSHpPaeH5CW130DzOwBX7qh8jErD0cO194QSE
 jAgxcXh8cNqz9ei6QlLdgNPn+U3Uq1zsYB7sFvDTfMzIjwc7oJgJjZYnk57XHlg+NUnU2u
 prAX09K/gfsoz7b0ofBGms74u+0na4xOEn0AxlnNb0ZwqsBUMV5VY/bAtER8zqs5oSwt8M
 wVAqCqiUmiO7567i3q4Ml7Shy+Wc2dwox9dDmp7RRThLTpQ5s5do0DLqEGiF7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1708858554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tAhOjFXIG9xCvbOQNJwE8wF0tLY2hpMIdA10BdIDOfo=;
 b=toyhiaZj4uFJa8bdasGrux2vDUqltoqzkAimBy3wcbRRovUKpHj8bai5Wi49N/YPTntSgB
 mlTofppt70ABSpBw==
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev
 <sdf@google.com>
In-Reply-To: <ZdjLvrBhW+NIcp85@boxer>
References: <20240222-stmmac_xdp-v1-1-e8d2d2b79ff0@linutronix.de>
 <CAKH8qBsCrYuT+18CsydQ5TeauRzu0Hdz7mZQ2c0W7er0KrJnkg@mail.gmail.com>
 <ZdjLvrBhW+NIcp85@boxer>
Date: Sun, 25 Feb 2024 11:55:52 +0100
Message-ID: <87v86c7qyv.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Complete meta data only
	when enabled
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1505050509411462009=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1505050509411462009==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Maciej,

On Fri Feb 23 2024, Maciej Fijalkowski wrote:
> On Thu, Feb 22, 2024 at 11:53:14AM -0800, Stanislav Fomichev wrote:
>> On Thu, Feb 22, 2024 at 1:45=E2=80=AFAM Kurt Kanzenbach <kurt@linutronix=
.de> wrote:
>> >
>> > Currently using XDP/ZC sockets on stmmac results in a kernel crash:
>> >
>> > |[  255.822584] Unable to handle kernel NULL pointer dereference at vi=
rtual address 0000000000000000
>
> would be good to explain where it comes from, no?

Sure, no problem.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmXbHLgTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzggvZEACty2xTOmModE7ISEW06ga7SP33J5oF
BsaLFQi7zC5qOZXJRAjhHtKTWjBb9UcWrqY35MnsloeYqICkfSH08Ik9t9WS5u/m
GkqF1AekS5IX1a6xZeASSix7/kA4PLFr07BBkbArQDhTjk+B6R1HM5/w3AnRjhAu
BOFvBXmEMfelBQGxHYeRkVML0kJp8E62yy1DSNtnBQZZHKYU4qzGlimKZKQZ3R03
qF3ItZGvOZhAg3nLhU1pvWAgCHp1Q9hmeK+AU4Zi5iGfrf/BKsmnHByT3TZfEHe5
g/7UlMrUjIllyQoQ7QruXAV1Z+eqD3IvZknQ9fdMQzrW5Pc7TkUweBzMOdVr4HV+
N+aIYNQYFZe1ElPftecTLpHTDLBg5n/g2TJAv+mAIkFrZWxWdB0viwHApX29nlrR
C0Iu/gjTsRn8+uQ6AArMcXd9Ahf1n3hP9MpsLnZIQZBQ1bRgLjrctJ3M0Fi0tt9u
3WOP5hjSlaR7YQzA8ar0bXstvkk3HStVmvww9GbcIi3sOPTz5CcIP1IcH4qjYs5K
JUqYCzCi+o349yCevOLC8hY2uyS2NpfO+vsY0mA6oGwLBB6/oJ9t2t5Rw7VYAXgs
SOjuseQcAu88gVmZHClGweYRcIEJ9M+20YVIShvxQW8/vFbmU+bbwZavBPE3BW5Y
zj8zV/VllRfdGA==
=aFZy
-----END PGP SIGNATURE-----
--=-=-=--

--===============1505050509411462009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1505050509411462009==--
