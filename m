Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD857C9123
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 01:03:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3632BC6B442;
	Fri, 13 Oct 2023 23:03:33 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB935C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 23:03:31 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4577c1ae94fso1162447137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697238210; x=1697843010;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rcn85z62MW6ga0naGLzuTjsyYsLiQwr0ThT4Anw3LQg=;
 b=F/DvPp6eGVA6S6BkZ+Bm2L1JsetAZR3FVoe8tjCVtBrhOQqGD9jFlLyb6kOX0KTnJB
 b4u8UqD8pbFMitu3VxDXuUKQAhZffUU8l+iE/CtmAk3R3a+UX7x2AmcBwpboiwRR/UBp
 L1t5aIrTaCTWCO+bKZ9CmSEQ4d5fPklbII2G/3XjtilWsU685JWLDUsp8h3enHXGgvOv
 W2/SAt9HpwiIQcFa4dLopPHbU2ZMlkRGINCBJtKQs1bWf6QYCvz0EsRZ6KnEveonCh9z
 cn416o8cWQ+VSWlFFxRQHibl1WTEtoRRNtjPkGynDbt/6O311O99G4HSQnTJLD2kqqV1
 XuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697238210; x=1697843010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcn85z62MW6ga0naGLzuTjsyYsLiQwr0ThT4Anw3LQg=;
 b=J2kjw3Swv2+5/fR4xcof+phu6PBBB+9k67TZzWnAF4Ge4iqFgv5zNM9U1gE605PnkL
 P0rAXl/oPlmykHLEecSNSXxcS26H2q19JOvf/FMPe1ZHRjFqFsM1uQKpp5XPQZ9kRIXO
 aipk80Y0jeREsxW5Dr6OWflL9PpHMWJ2Wvw8r2N6tbHxOpnmDhzh6n9w8BqW33if9H5g
 7cf5yYsPzDRUnO6AK/v1bna/0HcRclbzGwg6k1wKYvYHIvduBzmWjQ9LSuGzMAVInHWU
 hHajqRZCLEa9lQ3dpuqIfoxcSPtBCxECGupLNOxYpHzzAjgvUlXt26C/OFdr0QbGmCzp
 KRmw==
X-Gm-Message-State: AOJu0YzfhVZlpnHTMC53NLEQop5iVjmN8/2DXkReAonsjz3YjNmvxIvO
 v931mI7w9+jv9r0GJni7dsav2Q==
X-Google-Smtp-Source: AGHT+IESShPQpD+fP8oD44dOFdRAXvUyePnVcWCuKhsxWqQa7Q51s71AiV0cNscNwQFJMSB6GIsyvA==
X-Received: by 2002:a67:ec53:0:b0:452:7617:a757 with SMTP id
 z19-20020a67ec53000000b004527617a757mr27797924vso.26.1697238210704; 
 Fri, 13 Oct 2023 16:03:30 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 c12-20020ab0694c000000b0078cc4e0d7e3sm551678uas.27.2023.10.13.16.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 16:03:30 -0700 (PDT)
Date: Fri, 13 Oct 2023 19:03:06 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZSnMqienA28Phx6b@fedora>
References: <20230922143920.3144249-1-fabrice.gasnier@foss.st.com>
 <20230922143920.3144249-7-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230922143920.3144249-7-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 6/6] counter: stm32-timer-cnt: add
	support for events
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
Content-Type: multipart/mixed; boundary="===============0880221747740796995=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0880221747740796995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxeJ7ygJWhyBF1Hz"
Content-Disposition: inline


--pxeJ7ygJWhyBF1Hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:39:20PM +0200, Fabrice Gasnier wrote:
> Add support for capture and overflow events. Also add the related
> validation and configuration. Captured counter value can be retrieved
> through CCRx register. Register and enable interrupts to push events.
>=20
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi Fabrice,

Please split the capture and overflow events code to their own patches.

I think there will be some changes to this patch anyway due to the
changes you'll make in the precursor patches, so I'll hold off until v3
to review.

William Breathitt Gray

--pxeJ7ygJWhyBF1Hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZSnMqgAKCRC1SFbKvhIj
K6CGAP9OtP4qcJ/aIPKgrEecjHFXVX6zX1mOr8ftEiECf8/tVAD/cjbV86RlHwaQ
f/v03XJrz5ibiBFz53tKPk1+KnZ76AQ=
=cWtK
-----END PGP SIGNATURE-----

--pxeJ7ygJWhyBF1Hz--

--===============0880221747740796995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0880221747740796995==--
