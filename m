Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1C20F908
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 18:05:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4427FC36B11;
	Tue, 30 Jun 2020 16:05:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56366C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 16:05:08 +0000 (UTC)
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 372A02074F;
 Tue, 30 Jun 2020 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593533107;
 bh=DVQ7kn2/Wku/b7CfuzAtJBp0Fob1ESFgaHZeJXVEbJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/Za/jf+99U8fE9hJ+CG+bJjyPZUgqY+Da2VK5aWdBQBuU7E8QIADUfnnqiAQwc/2
 NOHbZBlc3hKxBnK5WYH+qPjeDYA3gg4Ato6os5prHvw5+ZXMMhEm5WgE+r87jSPnJs
 2b63ibRL+yPYmVOaLS37uJK1yYKjR6FrkLrIUpbY=
Date: Tue, 30 Jun 2020 18:05:00 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200630160500.GA2394@kunai>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert
 / Host-notify features
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
Content-Type: multipart/mixed; boundary="===============3804272859063612316=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3804272859063612316==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2020 at 09:39:25AM +0200, Alain Volmat wrote:
> This serie adds SMBus Alert and SMBus Host-Notify features for the i2c-stm32f7.

If it is not too much work for you, I think it makes sense to split the
series into two, i.e. HostNotify and SMBusAlert parts.


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77YqcACgkQFA3kzBSg
KbZ+qg//cgwscro7RoDB8rFd2lb0GlBRleq8H3qAVXJxZnOM7kKr7Y3gJ7cVOjCc
Ly2zLQOGeTpMZ3v5D94DI4DcxGXyH0BMKcXP7fw5llG24dM2Kgq/WFE7N9fRl4Fo
dLbxUjuBU1XXTc+o8K3CD7uEkFn1alBNGf1xeHinUvFOoThmGxh3F/B0KeKBH9OL
ydIFuwgBZJAbSrcA3TLLjqTF1THSFzrLI7eG7hyE3VqZs6xF8onzTG0OEIoD5Y+k
0N2cWxP8bUKUb4s50PDGsqeHkXJ/mmt+loWwh6O8955RXGSvxS+dQI6B6XB7bLTg
F2CEu7EvefCpKu5fjTfLCpMy0/ma7dAbcrvStqq3hMCHIjBWYq7A+qkhjrCCTzhX
6TE8Kr81w0hIoahxe5pE4F9BLG+KKVo6hiJI/oJT0ylRLQsXmrpBgNjzJooxzOYw
1T7qPD+3O+iUMQYPsre+JGY84cfDtjpcIptaJE/BHhi5U8Us1AQ5x3Cbw+4ZmIbS
2LW+Mje6F1licPoZoSp9o/HfwBt3TL+4aUEpyEwIWzchbhCWlbW5D7eTRtTOSr/C
BVs0mix8LliB6N7fQozyCmGI8+80Zqb4ZMSfAJ7AY5HWNRZUK1Q7XTm+uy7bP2oc
85NQkLaTTZ+RhuXmeitFb4tR31A9f9rxZRhXy7fTwV/Iu6MGkNE=
=OZyO
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--

--===============3804272859063612316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3804272859063612316==--
