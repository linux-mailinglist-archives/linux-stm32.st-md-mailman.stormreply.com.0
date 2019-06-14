Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E342A46B45
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 22:53:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94CD0C06142
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 20:53:33 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E4D2C05F08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 20:53:32 +0000 (UTC)
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
 by pokefinder.org (Postfix) with ESMTPSA id D46602CF690;
 Fri, 14 Jun 2019 22:53:22 +0200 (CEST)
Date: Fri, 14 Jun 2019 22:53:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190614205322.GA17899@ninjato>
References: <1558020594-1498-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1558020594-1498-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-yves.mordret@st.com, marc.w.gonzalez@free.fr,
 linux-kernel@vger.kernel.org, fabien.dessenne@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: i2c-stm32f7: fix the get_irq
	error cases
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
Content-Type: multipart/mixed; boundary="===============7824534735823782958=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7824534735823782958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabrice,

> +		return irq_event ? irq_event : -ENODEV;

Maybe -ENOENT instead of -ENODEV? I mean you have a dev_err there, so
the driver core should probably also complain?

You could also shorten the ternary operator to:

	return irq_event ? : -E<whatyouprefer>;

However, both are minor nits. If you prefer to keep the patch as is,
fine with me.

Regards,

   Wolfram


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0ECT4ACgkQFA3kzBSg
KbaP8xAAiUUQ1YDf9eeO9qQ5B7FKo7kXJ7iUA/RbGjfpC5zhjsoVgb7DdHvc7npe
PSrQ21fAXNJtFz4N1CcQ6A38C2/IYZ+A2NnmwNyzMhqL5W5Ah2gPl6UP7S6USF4J
4NnHw0/0eeH7/i+F13uiVGJudC+MVesWYPZgOBq9GGqgwxp7IztsjSOliBDRkC6c
6RtdlqXD0UfUt60sxIJz/Oy+SYRKc0V78KUeybe7+fT5gisBfF3E1Zs3OZFieupk
BIRuhXDNBQUTb7Cy387Zh4Im2uEzUb1qBIqC3azfJhNVyMm9fyiFGgysXNhkgEJ5
1CKiXadTzhYJQJUpxNDmYQcmk8t/cM69R9NKBXou8XCeutIbe4BA6myz0U0hz1Np
E7iBJ//LJpXAptZErq3n2VzDFHKKFWn4hyIJKI7LOZIdO2t/I/6wzJPMKxHJSOTv
soWDgPcS/D1to1Glq4+CPqwNicEXLm5q1H18UE0SjBskFaGwCwyjNFAvwwjmhJ4f
73uuuJBC3Oq2W/JqnYY+IFcue4GO/VS6ZughqW8iebSmwaoArzN00L844leXDkHN
0dBGj3bT/lcLrR+d7jLsWeHt4t6J0dTJAkIxBivl+dK2nta7NMalnqp6cFp/nHfY
R8KQhpWqlKhaoFGQzW1XiLNlKq+ZPC4MGq3h3thFOc9Z4lo96KA=
=VE/8
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============7824534735823782958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7824534735823782958==--
