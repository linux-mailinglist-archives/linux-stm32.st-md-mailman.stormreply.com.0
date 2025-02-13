Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFBA34E39
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 20:12:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E2AAC78F8D;
	Thu, 13 Feb 2025 19:12:17 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA262C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 19:12:09 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1739473929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GajXLDN2685pWJo9xC0Nx2+rK1EwQ+K75rt+Q/4qOCM=;
 b=NSpbBFE1aVWv4CUyVIyy8riKxiF2EC4/siz5rBzOHmG4U22DSfCQNKAOgi5C8eirgRh1ho
 bdpnUTW+2fqZgg1d0EoWomTjaGjCwh5DIOwHQ5uGOq1/YlWZ5OknnB3V+krWU5WnUPtR3C
 pQFv81WdqqMu/IaTr2hh7HjrZGpt+4lhh10WpZ699NXQMnaOfdymm8laArzpbRDDVjEsqb
 sTYUQsP1twvZz3YYXV6FwkT5Tb+ao6OTO3e5FJtp9tpsq5tsXzJaH78aGxs6IN++967t/y
 w8qHULwNTJ4XLP+NKRGHBOBJxV3Xn4wRNTLAiYbmOnmxPp6UzsSfdyCH3nwUnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1739473929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GajXLDN2685pWJo9xC0Nx2+rK1EwQ+K75rt+Q/4qOCM=;
 b=iZmKUni1dH4kiDDh/0GIAY089sWMZeS0ib4L4RxdVqhbyRgXwwEqBZ/AkFhfj6lhFMoShn
 QVU77G37xaLlkyDg==
To: Vladimir Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
Date: Thu, 13 Feb 2025 20:12:06 +0100
Message-ID: <87v7td3bi1.fsf@kurt.kurt.home>
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, "Abdul Rahim,
 Faizal" <faizal.abdul.rahim@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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
Content-Type: multipart/mixed; boundary="===============3298885655739940118=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3298885655739940118==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Thu Feb 13 2025, Vladimir Oltean wrote:
> So, confusingly to me, it seems like one operating mode is fundamentally
> different from the other, and something will have to change if both will
> be made to behave the same. What will change? You say mqprio will behave
> like taprio, but I think if anything, mqprio is the one which does the
> right thing, in igc_tsn_tx_arb(), and taprio seems to use the default Tx
> arbitration scheme?

Correct. taprio is using the default scheme. mqprio configures it to
what ever the user provided (in igc_tsn_tx_arb()).

> I don't think I'm on the same page as you guys, because to me, it is
> just odd that the P traffic classes would be the first ones with
> mqprio, but the last ones with taprio.

I think we are on the same page here. At the end both have to behave the
same. Either by using igc_tsn_tx_arb() for taprio too or only using the
default scheme for both (and thereby keeping broken_mqprio). Whatever
Faizal implements I'll match the behavior with mqprio.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmeuRAYTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgoNMEACxHuGRV1xo/6Yr14uiqR7/m6lnJfHO
VTBNS6156eY78HOjVVIf+0xjxVFobt8kZyohcfPY147TRWrpHMg4ZQ1uLu+YGkEi
xDmY+wpwU/CN+/8bbfQwijBQ0fHYGPmP7k0x416USYh3v1pw4nS8jOoZ/jOyV8PG
fM9g5geb8hVNqHwqTSMXA/YUBsZWLHyU21KZ0HPHsw7bADdXLEMWyFhRJaVY7FSD
SOdNfVqqjS0JZVDjq9VG2ducxhT7pX+3eWvtbXQE389lfGTmksx/Y51OFlIbRmpj
pvWvsxdQbD1/eAhnf5KBUWekuFLuGnJfvWI+cj0+Bm4dHiICIQHUgPj7Hg7xNiPs
eF1MfoS6N0ZDoO5RvHRB8DxzqUhBIOtDnEhBSITVraGkvH7C6tmtOHWrx1NSnuAs
d6Ia/wwRTeCKvUfMWkgFdIAJU+FFWSAxbOjNEDPzzbrACs+/M7m6O0tpmZUWnYbN
pXmA3a8EPGgkWxVgXBmQkqaPqCp8idSlLE1K7n7vIumuHfxTkg3QHa8EU7lYogkk
jPBMvornSEgDfvotXaprSHKdW+J0kiGTwZ7xDX3tUcAofflSmtbxFhOeXa3rs8Js
v/GJW2S0mWcjeCRbJePDGeg1PSQwXGmV2PL6WBzNOhjSBvwluBguSQnrLhfYwXtK
icCpedLirXUfiQ==
=C6Aw
-----END PGP SIGNATURE-----
--=-=-=--

--===============3298885655739940118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3298885655739940118==--
