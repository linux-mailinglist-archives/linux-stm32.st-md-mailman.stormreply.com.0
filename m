Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7820F7F3
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 17:11:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCD73C36B11;
	Tue, 30 Jun 2020 15:11:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5277CC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 15:11:30 +0000 (UTC)
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CCD120720;
 Tue, 30 Jun 2020 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593529889;
 bh=Kof5P3F4RhHddyde/k6hvfouOCHADx+GYO+1CoM3OgM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=wDcjG9Ffp2rf2uyADpUEj8oIWGdNSEHcfaFoqa6A2PydIwLazG4iE4vp2Dr3rz9HY
 lgsmGFRLso5cO8GTM1JLw/m5tCTB4+9iKbbfhPX7paqvUJBYp1aDsmOYduexVJd4XX
 WfNUaav0IfqFf3DoRSzEp6acRgJBg1ZWoLp4Ahao=
Date: Tue, 30 Jun 2020 17:11:15 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@st.com
Message-ID: <20200630151115.GA1058@kunai>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-5-git-send-email-alain.volmat@st.com>
 <20200523110140.GD3459@ninjato>
 <20200526103938.GC14423@gnbcxd0016.gnb.st.com>
 <20200630064050.GA996@ninjato>
 <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20200630093135.GC5652@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH 4/4] i2c: stm32f7: Add SMBus-specific
	protocols support
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
Content-Type: multipart/mixed; boundary="===============1509701919137238379=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1509701919137238379==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alain,

> Ok, understood. Fine for me that way as well. I am just a little worrying that
> the "host-notify" can now be present in both controller AND slave nodes
> and might be a bit hard to understand. At the same time I don't have a better
> proposal for naming the binding for the controller.

It is a valid concern, maybe we could name the binding for the host
"enable-host-notify"?

> Please do not consider serie v2 I just posted few days ago and I will
> post a serie v3 updating the binding information and using the host-notify
> binding in the i2c-stm32f7 driver.

I also have an idea for the SMBusAlert topic, hopefully I can come up
with a summary later today.

All the best,

   Wolfram


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77Vg8ACgkQFA3kzBSg
KbY4ww//em/vnMiq7NS89p7OgWcLT8uZEKJWygqaUmVWOpwz0HD1JlDWg1fgYnCQ
cICy1tOydUEo+FXs/AZty5YQHRSghTEYrEA/SDdTfKDassc897O6K747UW9OYAYN
94ls0vDGfyW9+MmyPhLLHbocYfHpyPusZyueZvqH5ou5+1RlmyPvXgg9/Hh+SCYR
oY4JoZZ0u8k/WpZGhS4z4QQKXJ/h2220mEvLVxEwt/ZhQWXWGTHCc9T6yHmplXxR
SQu64RVtAz/JZfOQcG6JiBsX+ZD707n78SClOSszcGrKMfFBGdXJa1giQcFI9wEQ
ImA91dkgWhYWYaynOyn1wydKElDfHSIm4TSjDo5JtIGO5u/+CrnYzrSBsJ76lz3C
VQ9XrgyN2On4t+hKEJ044QKPJcoGUBnIUx8ERU9JbEIXHgHBmXNs0Vvt6gH0cBBu
hLMgnRWOUZdh382yowRY0cdq3gD4ePXiivAVLoDaQDDetk/eWX9GIZNPROU0rS6E
/F7W8yI3hohLmvDqA8AnHvEQR3wnNmmXBCJLV/sK3Q5FI8OEFxETwsumAziY4nHW
rujYZBZ7z+apz3Bxq08DUZxj9aIZ+o3SN39cW7j3pU4e47wnrpf4WRCAchwiVjvu
EkaGFUnE/oAmfrP2FzisenLvLUvyZ477TWrDVytEHbBzgWnfEsI=
=6INs
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

--===============1509701919137238379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1509701919137238379==--
