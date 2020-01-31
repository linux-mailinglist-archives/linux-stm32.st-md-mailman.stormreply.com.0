Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B714ED8F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Jan 2020 14:41:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A30C36B0D;
	Fri, 31 Jan 2020 13:41:05 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CD88C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 13:36:24 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id w1so7133704ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=36im6bznVr3VlhITe091kW2o8aBJr7dAtawFyqiBVVc=;
 b=aCgWyI54FFxymXQIxylsUJxHwJOzcvMk/eK3kXkaRxQUbLwqy7aA51PXmRG0vrmNdu
 K93Oz5gIeIiopw3F/E+0VjM54ZstePlZNcnLw5mhD+Y7bcSsalgiyiuO4Zfx9I/Iv/Lw
 a+O57/lv01X6ZXtROOF4NiOQeIILLCnBdgOx/pAfG4crT0ZFffiutPawQwfh3HtrPodJ
 SW/lIw+B+PPgALXnR0QiV1SuODqPAr4b6h7BNk0VWA9JkV2elmr6Rj5slkO8H9bQfANc
 YfXePRTFJ2YqY/Nx30dr12Td1rMCPS1DWMTrmFciMVCfm5Sv9rzi20sy57Fnv7OasVLa
 ttTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=36im6bznVr3VlhITe091kW2o8aBJr7dAtawFyqiBVVc=;
 b=fRAmG+p4Wca9JEb6z8WszUq8xdmuNR2IKVyHyPcBwKBhfkeyiuIgDxfrpbGMVMZ7S/
 2bWwE7t1qqfdnTtc7YWd5XLxJvd1ur4o+DqB14FmjbMgJ/lqdAklMhIC1oOtysfEMT3M
 vYUD9OFXF8NJDsFzDBCpzSNfkqqtyHGPRomrRxB/OB/2sEtRsLX4cvIHd9O5GULuzRre
 P7SWQtij9PjLPGOnsuu6MfEMZPu0C2/hbsM7yV7gZR+f/de6nE1keU3nAi2BYNtHguhb
 I4E7HhPzQ5Ge2fSuTOF5sGIKsPID61PUCRLgYzA9tQQYAODa0ze5RZUfkDXaIFP8TiST
 M9Cg==
X-Gm-Message-State: APjAAAW/jWU8YsGiKvZ/s+flyyRGjii26vmKavX+VeDziRNSlIIeUz6C
 SNZvwoOuCZiHPKcCYUJ8osE=
X-Google-Smtp-Source: APXvYqy9SXfc4Ak9UEw8yYRMtjd1zHNdFzILr7FF5HWU+feIs3Zgjdp34mjDT2MiG1qbVqC08wXeEA==
X-Received: by 2002:a2e:8944:: with SMTP id b4mr6106832ljk.90.1580477783171;
 Fri, 31 Jan 2020 05:36:23 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
 by smtp.gmail.com with ESMTPSA id f21sm2901282ljc.30.2020.01.31.05.36.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jan 2020 05:36:22 -0800 (PST)
From: Felipe Balbi <balbi@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
In-Reply-To: <20200124084131.23749-2-amelie.delaunay@st.com>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
 <20200124084131.23749-2-amelie.delaunay@st.com>
Date: Fri, 31 Jan 2020 15:36:17 +0200
Message-ID: <87imkr7nou.fsf@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 13:41:04 +0000
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: usb: dwc2: add
	support for STM32MP15 SoCs USB OTG HS and FS
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
Content-Type: multipart/mixed; boundary="===============5165346063581431098=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5165346063581431098==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Amelie Delaunay <amelie.delaunay@st.com> writes:

> Add the specific compatible string for the DWC2 IP found in the STM32MP15
> SoCs.
> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> sensing comparators.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

This doesn't apply. dwc2 bindings is still in .txt format. I have taken
patch 2, though.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40LVEACgkQzL64meEa
mQZIPQ/+PCvVhKhlTWv/YRoBCIDmZrvMR7z4BnhSOWmy8BihbEU5X7F+qo3P+VyY
Gw/us6ppE93yom8f5mljaKlLrB1nWhVa8EU3wq3kFSDgIcMZ1HV8zBWDhqDClcN7
SG/fImL0IxTTf9SDhPiNU+Kj+MfUMuwMmoIcvqDfoWtM9lR/9JDWOPfzTHYWl6Qv
5zkxOrMuTA4z+/yYQpwXsmQxUQnywhhgN8AHmFCeXtnO+AsdutFJHM52Pp8XXW7I
s6SMdX0/EaC8IFCxLXYIdRw1agHTDwf5EqtML1d9pVrgZzGC4wcknDwWZMwvRTha
YXNRFPiQ6bqzeT7RJPRpxBtoYZDXxBNXQ/cqVt+FTiv3G+xYiVW97Sj1+fwIC7/0
T/A01s7frHhCnJM5pDErhoJW0aq5BmesgxW2AhyY/M+mXlGbjcKCKDWahAuhf0Cx
s4em3gwLACNvw1Ztp1sv/BvRAE81QMt9+m9PI5pZu8IVU6PpIb1jQBsvgu6POoYc
9FIhAqYKYuzIgF1p7z3ee2c7+14IwJl1br5P6Xyx81IeS0gna8v+vicErSPCt+On
r8VDIjv5dknh5IoQfO/+q59f8mp3e2XdVB6pZYTwsJu2i1nK6Afy/jVCJICw1I+a
7FD6QaprCNakl/Zbfv8wJUQaKbCChpZEV3gNL1lzNinIG6b2KDc=
=QKjo
-----END PGP SIGNATURE-----
--=-=-=--

--===============5165346063581431098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5165346063581431098==--
