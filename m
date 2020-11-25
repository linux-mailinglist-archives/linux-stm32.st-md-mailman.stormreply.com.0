Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF01A2C40E4
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 14:07:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE48C5662F;
	Wed, 25 Nov 2020 13:07:59 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00E9CC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 13:07:57 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id 7so1513534qtp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 05:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mMhr7if+ZnRG9MhMHI+KNa2LdhxLLABqJa+FncSk4Ss=;
 b=T2xVHBnpNinPB/LWXNXkxkZaoP24VjjodPX8UKsm9aU4/4wtS2oZiNVbe4q2HAc82w
 uIuIz3s3DmRGkSqO8C9p8QmFJ+3qOeB8jzVRoYrab4wNEV8mPfVTcknf3fWoP2Gd1cvy
 6/7Dezb5IR3UGkhu4LcNp+SxlNdl9Xa8qmG9ScF3kkn5HcfpDMScgQO8CuNlGNu2naYA
 B9T0NFIvhaXQGVMtdjdWHJp1Kdm2rdi7bg1iOk8joFKeXKzNzRnIv7nYGL0lzxmZf6Ul
 bpVsDhpULPZGJWHGfELInwZ1AlWdV17bmHYtbKolm0S3edmhrIf5+wDbsB2slnXqHz3N
 XKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMhr7if+ZnRG9MhMHI+KNa2LdhxLLABqJa+FncSk4Ss=;
 b=DudFxfZqmfhJpsX5GxuEMGESnKUIg3gGYxTr+UR/2Qgdjsx4CW0uTKNIgT/Q3o7uaZ
 d33qeP8u+BAaqu6RQguE+4Qnc5HcQ1lss7RlI6zx2cP88yrCMz3+pomWLjV9pZjCKZLS
 OD/YnFhA5CaSHLdfuYyLLnyga2MVmF1+2+/1YLAb616kZUz9ZO24WtJGFKLLDhLH44z1
 yAGS0hvLAtvw9wVtag5n1m60CD868PJtO4u9hvSsZL0R+uA/CQa/4FBA/IzEZvmaidVF
 afT+lg993uhNfdv85pSddX4eD4LUXKDXfocYC1/efcs9Ssbbv0+2zug4WT5juPr4EbHC
 fdFw==
X-Gm-Message-State: AOAM533Ba33KP8EE0cJ+WMMbHGu0IWmEjA4nd8Td22eA36UZwtkOgKvP
 JqkDhhbWzBsM/M7VgEu5lSU=
X-Google-Smtp-Source: ABdhPJxJb4TUF0NizrQVHPOB3OFujzxO1AeeC8RmjaIrDGlIDfo14gqg/cJv0Tldd1XkjLq0l7zMfw==
X-Received: by 2002:ac8:71d5:: with SMTP id i21mr3049929qtp.4.1606309676849;
 Wed, 25 Nov 2020 05:07:56 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id c6sm2443740qkg.54.2020.11.25.05.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 05:07:55 -0800 (PST)
Date: Wed, 25 Nov 2020 08:07:53 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: david@lechnology.com
Message-ID: <X75XKTy+8cqPyzlH@shinobu>
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
 <950660d49af7d12b09bc9d3b1db6f8ff74209c26.1606075915.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
In-Reply-To: <950660d49af7d12b09bc9d3b1db6f8ff74209c26.1606075915.git.vilhelm.gray@gmail.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 1/5] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============2721659516409020557=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2721659516409020557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="51cx/e7mr9ap1Ofv"
Content-Disposition: inline


--51cx/e7mr9ap1Ofv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2020 at 03:29:52PM -0500, William Breathitt Gray wrote:
> @@ -117,62 +112,95 @@ static int ti_eqep_count_write(struct counter_devic=
e *counter,
>  	return regmap_write(priv->regmap32, QPOSCNT, val);
>  }
> =20
> -static int ti_eqep_function_get(struct counter_device *counter,
> -				struct counter_count *count, size_t *function)
> +static const u8 ti_qep_t2c_functions_map[] =3D {
> +};

Just a heads-up: this ti_qep_t2c_functions_map array is left over from
some code I was testing. It's not used at all -- I simply forgot to
remove it -- so I'll make sure to take it out in the next patchset. I'll
give this v6 patchset some more time for people to review and comment
before I submit the v7 revision.

William Breathitt Gray

--51cx/e7mr9ap1Ofv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl++VykACgkQhvpINdm7
VJKYVA//dqccbhIoBaceJes3TqLXOFW/M8mwfy+XZ+rP/ih/h8l24f0y0gLPWYnH
g9rV4GH9VOeKz17Lkocb5dKgPhBR6ugL7IAWWOSh7SI4BTg9eT8iVQI9AVYAbXD5
vmZHxvt5zhEjO7l2l5fBstZObzpgTv4eJW+cjZle/ZaCdTVXm0/m8kPNzQU1xtgP
sa/6twzxxE8i6PwHBk+aP7MKYSMYp8hjtAZPVtniAAFj0XdRgTIn4GckYmp4zt6E
gdlh9KdSAnf/vcG7zR2OrXk4YMUOE4grLqBkx+KUWsNi7AlvLX+XHBXeVCAgnljx
KIkro97m6rULfD6yHL48aAce/MMu0r4s5tZ5nRa7yL6pE3mY8Ajvi6k9lTu55NYN
CKTLFUf85+GRs/GUZsW0VwGVmwsGT5wawJZiTkPxYFfa+dgMEBMoaCjUEEZrw7cm
bxk2k/ffuIIi/UGQWtXWPUKXyCIaRm05+rNxK6s7OP/EhwCOdbBKvFLc998AwdyY
Vl7+tPLntu7H9j3vuZBr/tPm3PiTCTcIzGa4WfaYhJMDw0WXKYLrXGdQ0SUvnk2k
BnF2ob6wDL/E/x2wFJABYB6OH8biuob2S/LuBdlTNBAOCzMlDTPylFVhjSxSJ8jt
tWyXUjmfq1xws9/39/0J6vW7QBxpgOOuc3vFP4Q3y6mnBSTEJcs=
=388v
-----END PGP SIGNATURE-----

--51cx/e7mr9ap1Ofv--

--===============2721659516409020557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2721659516409020557==--
