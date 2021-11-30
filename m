Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B60462F90
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 10:27:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28510C5A4D4;
	Tue, 30 Nov 2021 09:27:43 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8CBC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 09:27:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1A88BCE181D;
 Tue, 30 Nov 2021 09:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4E9C53FC7;
 Tue, 30 Nov 2021 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638264457;
 bh=W8CE3cPbhNtMoO8hl1s/FLPTFSn34F1Nw7lE7AMcsIA=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UoONgVPEsC9vpaoMTTISZa3IDl6GMwNM8x7l0arA0JqyJ0TC8R3RpjC//3iwFGKCu
 W3d6CnF5tpunDQJHWfgXivE+QiypHBDB1uginz84WtBF5tbmvvCpZ/5PEbPa7MZ3qS
 uoaJM0MCF1vpP5f1P4XSSCbWh0x1fXYYRgNBTGxYD3vWPrg1YhvZ9Jir+rs54tBdSc
 t4CpTf+cP5l7ONiAvKW3nQc+ck99H+7UI9ogVympssY6jzvtS/n8t/KPL8g0YKJJLA
 NY28mvsbKoJN6nNBoyOt76r1H/HSyUqtfL4ocJExR5Nl+ENzr5qz2ANR0ifFC6DZ+9
 oe0ENo6zoXU9g==
Date: Tue, 30 Nov 2021 10:27:30 +0100
From: Wolfram Sang <wsa@kernel.org>
To: pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Message-ID: <YaXugmLdXkaM1pk4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
 <YaTNDq7rEyQIopim@kunai>
 <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
In-Reply-To: <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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
Content-Type: multipart/mixed; boundary="===============0652874199151618395=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0652874199151618395==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o1/kEuTPtFxza3Gs"
Content-Disposition: inline


--o1/kEuTPtFxza3Gs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I agree with you on the fact to decouple this with the 9 pulses bus
> recovery and first apply this one first.

Good. I noticed something in your driver on the way. Will send an RFC in
some minutes.


--o1/kEuTPtFxza3Gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7n8ACgkQFA3kzBSg
KbbePA/+NAO90IQcrq/MNtcd5t13UslCVlXXNauFGvI2Ur7HFZ1pf3ZzG22DQP9W
l36Ta8LtNt+dCrRj+h051bUzS2FJA4Lrt/hQ18sDxKTdysoulGZUXNcn9VyI+xfF
FNl5EM/YWIPaSQMVm6Ks9vm70v+r2jnxCpIBb6p7qRtAlVSjCgKCvmaX5bG410mW
Pcl46jss+fySA9j8IyYn/3zVZNharjsH4jlk8yQotVlkRsVTQwviMk48g1XqcqYc
ha+9FkrklpdYuG6yQ1r2OTiQmZtIgO1OBSB0+3ChqhNyrXtM4vkUehsEUiu0UMyN
VaPhhSxnDItRPdEwGmU7g4NxA5p5hk+5ejM+26lYNTLqhO63mnflq1b/GI/wgKEB
glr83SyJnSghjAcIl2EprtkNiU7SEWPm8wEmLmwCs4PZ/DjVy8q0hBu6Zt+CWFVP
r+VDE9wIxcXYsy58adm/E1oFRlKxSylNhwFj3JJ9lEPSOfmUgcWQeqYgUWr5fBw4
ofVJAMNqS/rwFHI1xB39u4KZ1UmUvXcxfeH0SHayZwWyBIACKO5/X+M1jMlFlOd6
EgtWgE9V4buQrVmusLspa3jcs3UHetCo0pfAAKxsPMja8I5PSKLw55F6LYpfk8Ja
bmyJEKBGR18blkSGZ93VQvC/dapJ/tyvL1aWdJxT4g9GnbzYVhs=
=x/KB
-----END PGP SIGNATURE-----

--o1/kEuTPtFxza3Gs--

--===============0652874199151618395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0652874199151618395==--
