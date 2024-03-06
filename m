Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E65158740AE
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 20:44:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7951C6A613;
	Wed,  6 Mar 2024 19:44:00 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F17DC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 19:43:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4727e38ec10so33336137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 11:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709754238; x=1710359038;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3h1bbnwAIyReRJZyvKPJxbEARb+nxhxtKQ4kf1OInaM=;
 b=rXAIzWz2II6mmJdOWDqlPcA0dHnwWiCnMinfyXiskSune2ecnvOWKGpW8jTNRGOxyv
 4zJQNUt7oMW3UFAUlQgkPxSbQjdlXiiLM7DcJA7BqG+TZ4uqzqciOEGItpgLk8tMArYi
 VfwjWHNQj0yyi1sMGAtZs3ZCzTU2RTLvb2UWOCUB3KZYJY/t34W6GfPIH12E56nzFvf8
 +jhoCbuML38i6o70+NjpCBbSoymEDazPIubEuAGKU+75AjiFOOd/Scvu6Z+TMaTxEqiq
 bF76LOAEpBST3+LNrUGFJ/LYOAEqLpUubbFSU/w93ssV76NZSze3q3Yq3ifUQwu2GbWk
 MgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754238; x=1710359038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3h1bbnwAIyReRJZyvKPJxbEARb+nxhxtKQ4kf1OInaM=;
 b=CMcQzzN+AOecipwUGwSwsWzAghRxp6XUL5V+VBKtmWrpUHCf9XnnsOVgnWTdKb+VdH
 HwZ99QyKwHh1/M+sbPwHq5ZHBAe3DoL3J805Hp8TIWcSN0Gcv/ugoEFIsK8J5DzpCJOP
 VfvQirKkeEL1PmFgZ78Fs8n++LdHxMVvGk9Nnyz8YLuF8bP3Iuulmn1DkDXn8jOTBwYe
 H770/zh/FacduL4DxzyFk1mpkjSAvUOD1/IstZG0sBuS9lB5TR10Zz0pb7PefI43d4NF
 /lcf34k/Ww6OyIPBq0G4nG7cpg8T4kWfrbUNC3XQdjAcRgeroYXuIAJ3DdJ6U3Rw9v59
 I42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJkfkLa9MaJ/M9OYnFRW54I/VwSDi1LahLkgHypEnJNUp9DBkULlGQdPAKlZjS38kKKvlL1dmtIeQlb6ECNI+v++7U9WeSp0YR+Y+2R/s8DBjZnu6Z6OoI
X-Gm-Message-State: AOJu0YwAvRbgsGzuCekd+8xlO4uqMMhkVHecHj6S0WIgWuGaxcQ6IkAW
 omFcrf+fFfm9AuPKjgM7j93KJI/KwwFrTooflQr78GUjjKai68xXpkKBqpnpUDs=
X-Google-Smtp-Source: AGHT+IEyLGk6lO2/Z0y29ajHV8WtFiOo34D73UwYULuhEUyqvjui+WV95jfXzAfgg56mvqNDNS3sgA==
X-Received: by 2002:a05:6102:55a4:b0:472:7b61:70c4 with SMTP id
 dc36-20020a05610255a400b004727b6170c4mr7625665vsb.20.1709754238304; 
 Wed, 06 Mar 2024 11:43:58 -0800 (PST)
Received: from ishi ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 cf4-20020a056130114400b007d5d3dac7dbsm1970664uab.3.2024.03.06.11.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:43:57 -0800 (PST)
Date: Wed, 6 Mar 2024 14:43:55 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZejHe8C_iy4ZNXEX@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-6-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 05/11] counter: stm32-timer-cnt:
	introduce clock signal
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
Content-Type: multipart/mixed; boundary="===============4265761603348722273=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4265761603348722273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UUEoCLXwhPXDowOG"
Content-Disposition: inline


--UUEoCLXwhPXDowOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:37:57PM +0100, Fabrice Gasnier wrote:
> Introduce the internal clock signal, used to count when in simple rising
> function. Also add the "frequency" extension to the clock signal.
>=20
> With this patch, signal action reports a consistent state when "increase"
> function is used, and the counting frequency:
>     $ echo increase > function
>     $ grep -H "" signal*_action
>     signal0_action:none
>     signal1_action:none
>     signal2_action:rising edge
>     $ echo 1 > enable
>     $ cat count
>     25425
>     $ cat count
>     44439
>     $ cat ../signal2/frequency
>     208877930
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Hi Fabrice,

Rebase this on the latest counter-next to account for the
COUNTER_COMP_FREQUENCY() change, and that should be the last thing left
to do for this patchset before I pick it up. :-)

Thanks,

William Breathitt Gray

--UUEoCLXwhPXDowOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZejHewAKCRC1SFbKvhIj
K1s0AP42PGLQj0Xyd8x57hYGP2PXXQJtYsVAEQunEFZk1MJQqAEAhI9IKmZMCY73
uD5bv4vCbfx4aFk0aSqwtkdXbSu4yQs=
=T9k5
-----END PGP SIGNATURE-----

--UUEoCLXwhPXDowOG--

--===============4265761603348722273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4265761603348722273==--
