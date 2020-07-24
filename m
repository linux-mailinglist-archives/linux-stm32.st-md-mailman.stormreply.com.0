Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5FF22C6F5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 15:46:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E796C36B27;
	Fri, 24 Jul 2020 13:46:06 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2226AC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 13:46:05 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q7so10052404ljm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vu7AEch6tVK5sMQvHGR0dpGgNZ7jy5+kRB2EBTC0xyY=;
 b=md52HGXBAlYTKVX/vc+E2YSVjr9cCh2sxaZhVBVMKsXRzJ4CSFyeQgo+AsUD4dBhbH
 a+BJdAwGPp0mmtKuPJL/woOC7G3k+QGxLaapfHOUSN0vYTKjBXGf/ygoJDNZPNATlrL0
 lNBgyM5+CJa8MnczwRhZChC9rFVwHfVd6CbkuRTgZgYh7KbAgWs/wIVNNOiIvRFqg4gz
 xRvu7Hd09vR3832fkvN3VcVhqg2p/mq5PMfAt7NeAdPXmlGPQ/PKxc4K6BJY5ohcLDUt
 Msp6JmptEwjxnEOlrjyoWSGU7e8dftJ575WnnlCkva/edVsbnfW6GLkF0WLowrlXU+NN
 5pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=vu7AEch6tVK5sMQvHGR0dpGgNZ7jy5+kRB2EBTC0xyY=;
 b=umB4A7rYomhrJQyQdbWGqTwE5N+Lgoah3k5EuA11vutbebAwjjcsWkcsYci048pjbQ
 fZavJduyeWgYJnDghjSQ4TFRm7nOhjrTzTzTEMfcsCMV5G4JdYkcSj3g0Ov01ilmzR82
 IeVnDNCrknCHPgza8svhJAqFj2pZFt3CCEugwvGoK+JRyetTuclFX1p8E+L1FNpNefUJ
 +ls4PuYE199lDMjHM2kQ9s8+BV2BD/H0KNdIl/McP/J5rT5TqRXF/VZ5rbx462/sQKQw
 NyYWP5rkRfqyL3Gn3eRq+hv3eNybPdmd3r4TzihpB1jLA/JK0Cv78XA/HzKdKlGzqmyA
 vjhA==
X-Gm-Message-State: AOAM5316N+TjjtFDvA9w+/lGLjH9w141XzWNesGAgcwdLXmECHPv6hRf
 HJj8jKB2AFP6dMErCnWPcmI=
X-Google-Smtp-Source: ABdhPJxRLBdkoLiQ3bIn3g2yWD91G8Xg1O///R4OxhiwVBRMiIkVf0EyOqY9YyLcvXE7EpEcZxM0Cw==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr4663110ljj.143.1595598363953; 
 Fri, 24 Jul 2020 06:46:03 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
 by smtp.gmail.com with ESMTPSA id i11sm289423lfl.31.2020.07.24.06.46.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 06:46:03 -0700 (PDT)
From: Felipe Balbi <balbi@kernel.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <97cd44c1-9e19-94bc-54f8-204d79b79975@st.com>
References: <20200616140717.28465-1-amelie.delaunay@st.com>
 <d8069a78-2640-d112-a2fb-d86b99a8e44f@st.com>
 <97cd44c1-9e19-94bc-54f8-204d79b79975@st.com>
Date: Fri, 24 Jul 2020 16:45:51 +0300
Message-ID: <87blk5owkw.fsf@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add USB role switch support to DWC2
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
Content-Type: multipart/mixed; boundary="===============4649005185292631993=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4649005185292631993==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


(please, no top-posting ;-)

Hi,

Amelie DELAUNAY <amelie.delaunay@st.com> writes:

> Hi Felipe,
>
> I saw that you took DT patch (ARM: dts: stm32: enable usb-role-switch on=
=20
> USB OTG on stm32mp15xx-dkx) in your next branch. As it was already in
> Alex' stm32-next branch, a potential merge conflict could occurred.

Thanks for letting me know, I have dropped it.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8a5g8ACgkQzL64meEa
mQa6GA//dv6un4DfWkydBfBMjWWl9DuRCyLB80t59IsGJejlkudKuN4qaqQSbEI2
DVpyiZKw/1Nt8aTpQJTJgsgf69vIzkhsxvkQ8tIrYZlXWwUoB/HKClA9R1gGR8Rq
oI50A35v0hRHTFoE3TlOXxC+NBeGkHw+O+yCEhOFbevHJ5N9JW6s+Vkaur11mgc8
kYIW1WYPrQ2oTAPlEgdv5HRoA2UCZX/E9poNn83gWSe8r3FL55huLPEb3Caem01y
8LKRFgDSbvoiVrVZM+bQ7JUlu0ORvwKlTak4q4InvqE9VqAsHBstN7iNvutYwtCM
X1RPT8npXN+mR8U+r1QZOZ549YDuVe/ToTPBoz6IaAf7H4OH2ET00nfEcEbJGWxJ
rap1HuJDfKFJb+4B9j5lkqoaTE25JyNqk1XY3UBKtnU4tfMeJVHw8GxJIdy3xiM/
knkPyZEk3nCRbcEoUaVhFPCvKzGweMtaer/xIw6VEM25bPZzRa2+r+2kz9k8nYnO
WfXC2r1IS2WXJC5arwG5dStHuhngmEPzYQdvV0SPCnhMHwJO9Z5rmD3F8fRNsZMS
e1kTs9dcurhVJz/Gm0RS/66kIJJGQT1xxf8/Z/sjln8+ShrPe1HDJlhsn3MEqP2l
BMh1Hh8L66Sl4tNmIB8NKl0Zryn3G/gIL8w+ExILXYzPMzhRYkk=
=6nN4
-----END PGP SIGNATURE-----
--=-=-=--

--===============4649005185292631993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4649005185292631993==--
