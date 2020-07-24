Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA322C709
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 15:50:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6BFEC36B27;
	Fri, 24 Jul 2020 13:50:47 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F06C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 13:50:45 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id d17so10053013ljl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=kUQlJC47iSe6M2DGwLKnxLxm68K3q0yDXR5BlVZeOq0=;
 b=dPeXe6/UQ2wtvXiOKUEL6oqdDQbEH/zbCoWiNrdkxWowO5Vxf33tTLJRFpdLpalJR2
 AXwGuP3JkyAzYQH3bqeQL9NXUfITrspiAzjXS1yf/UKntbrztz36jWgLBEdDuoGlo6Py
 Pxe99WmG4/sEUjkUz7XhiH3gGVvaavsNmxyoyJtqrNI5FIOxrjJxy939JG+YxVaFvJhJ
 SuQ3HnCGBy24g6AZlZ2/e94yEt6jxU4HBzDQH5DFH+SSK8FyXbKkVk9HlqkRcTjqgGao
 iQDYlKQD4PZppjpd1Wu0TmpHlhr8bCRIEoOe8a5mK7eSmUBTPOrXgqi657+j3nhJddAL
 CMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=kUQlJC47iSe6M2DGwLKnxLxm68K3q0yDXR5BlVZeOq0=;
 b=OLdNOAuIVagvtulwfpyUKR8oTQLZr9Dstk8oROrGIi7iIJHvktmmHBv2AK8oOdB1nJ
 EyiMVMO5BtyIHt6IH5hT685AaazfQyjMjrYgayCDtFp5w7ozEug44qiVu88YqaXuwzDG
 yUDZTZDLJf0G3SAx++9OB4xyuJxJa/bdVQ+l3IltQuCA6n/vavCe55VdxsnIMxKWUBn7
 pBbPM2EqwnMEiIeSmHKkzNQHEkVQ7H8CyJb3G5AenA3A7lTlzl75Snl6MuEiAiqV0+aA
 ThuSy661x0Hw2mV1a/1UvwB6sASMh2Nd7x5Xl6ln0b0w1au4N3fEbln2EUpaSbsNtMey
 9FwA==
X-Gm-Message-State: AOAM5322sDHbVi778+hYbnn3mwhakI3Y7fhWw70fOFYCaCpyB1e+gS2O
 Ghw8gxA9T3t1r0aeTZLPFMU=
X-Google-Smtp-Source: ABdhPJyxuqN2HEdFLAc+Q3u9eWCvpysSuKBqPGUda1JPOw+Hfp2im3d3RLNxHHtDAEIxAxjOTsvkRA==
X-Received: by 2002:a2e:7601:: with SMTP id r1mr4719977ljc.111.1595598644870; 
 Fri, 24 Jul 2020 06:50:44 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id i3sm262139ljj.64.2020.07.24.06.50.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 06:50:44 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
In-Reply-To: <4c44f596-d2c3-6d2f-bf28-9e3964b6e6f1@st.com>
References: <20200724104711.5474-1-amelie.delaunay@st.com>
 <4c44f596-d2c3-6d2f-bf28-9e3964b6e6f1@st.com>
Date: Fri, 24 Jul 2020 16:50:39 +0300
Message-ID: <878sf9owcw.fsf@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add USB role switch support to DWC2
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
Content-Type: multipart/mixed; boundary="===============6034058500669903278=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6034058500669903278==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


(no top-posting, please)

Hi,

Amelie DELAUNAY <amelie.delaunay@st.com> writes:
> Series dropped.

what do you mean with this? Should I drop all patches related with this ser=
ies?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8a5y8ACgkQzL64meEa
mQZwdw//cL+ayhQjvZnVUc/UnTmN0Gz5U4rAtml72uI2Db/O46+5Q6rNYt0SiPIF
+uiB7fPCPAuYc6zUGLUBp0VelHkN9J6S92LG2TVDWw1Lry/AHVV9exuMcpxJJQxF
P9qkqx58LJgXCYcqh6fEaMcda5sE8YwSquQb8NSAxtQbX2sZ131CDEH+jlprRREh
Nlkg5rYqlH2t17wa8rZ/u8SVpiAJ1OXwP0hH+GqXvBm4tgOc6K2FVRYGvqm1fHM2
BuQvNKCWAE6OkXeia8NxrAl7ME75zlyACkW6jDkVrTUt53QcLx6csjzElLiOmEpS
t1z4iPud5bzBlHFn4/251TaojqP2SNXHpDGjaQ8lCeBPeqLTtH+SryxQSvpO3Jib
F6a2a8Rue4GshKF/nCOkyHDbEVmUBo9Q4IFYL7DbHV7xJUfevfSne+Lp1a6DmDXm
BdvqFvdLXlnrK/Q1Ym83E+VCWz19xJcDawUOMNeZI5llrl5QoMj/4r1uSjrg2Dez
U8sXUoApM3s+9gUrU+rpgu4r10O0vRKgcoDIEj0N5+pGH1q0Ob+CvUmH/M4kOckV
vkRkwgMWiGs94k2cI0XitObHTnh4PGZYkhPPIE35KSjo+lIub+1VwG/sZ+J5B0Q0
Lak7Px3WwyvEXLJu50hshf94FTzduEx7ZiXrWD4hCYDWVr4ba3U=
=Q6yp
-----END PGP SIGNATURE-----
--=-=-=--

--===============6034058500669903278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6034058500669903278==--
