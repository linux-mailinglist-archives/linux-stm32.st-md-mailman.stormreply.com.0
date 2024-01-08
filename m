Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A770C82753F
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:33:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51B49C6DD66;
	Mon,  8 Jan 2024 16:33:32 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1F07C6DD62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:33:30 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-7cd42bc0f1dso527854241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704731610; x=1705336410;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g+fG5v+imY2py3wbXbsm/HP6trxiLASLFZtD6HV2z7k=;
 b=mcf/nDnjqDvFl8q/0xQbQrYPEDKdx+Y8cM9Rs5LZ1ZTJJlj5iBZyw7izRjr/irI7r/
 N2BVoLJb+0AF9Uy4AiCEGv+GBUOlHy4AYUyAkeTqmrICjNxDcPxNS87BlxPblx47A50t
 L2oGaHDZ3xS0hQeIQtTerwkFTichC+VxKsU45TgQAI0zhAJ4993dgt4CJmV0tr4AZUH5
 isLNoq2XHNPeBg/8DppWRFivuDNc8QHxqTHhaWSivJUuJopYwrEm1wt+hcxREdlwrQBx
 srpXKitLrSrWM56EpazfhwDMNoqJCnyHz+clqNR6SJHpZ32zDo3Sj6bZ8BIz+CSFNw3p
 2prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731610; x=1705336410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+fG5v+imY2py3wbXbsm/HP6trxiLASLFZtD6HV2z7k=;
 b=qfy3NWOK6q21bLUVwcCQtwaVsYTk8jv6xL0vSpaRl5ww8xWr0z09G0rr6Ok1BVCv8E
 1xMdmzMYwcXXgMpBM7kW/4kOomNOc3nmLIrjDxCi9ypKXv9HY/lLReC8hcHba29tG0tm
 ybC2mj0mFMThRQ/AvQfl3+fd9iAGU2xtUivPHwZd1wtodC1zfSwk4yj1p281hLkm/IUk
 1KQHTTxAQ0dC69D/tqbsVFhiWaV1o3L16rQsRLOJtc7h1JhQu6giDUNSQSUHkVHRFL8r
 sOx2WDt24nxRcZsazDFyDDsGghf8nufM9gzCl5aYvS7zvi47+oXOEtB3K2WV3rZqPY6B
 L8QQ==
X-Gm-Message-State: AOJu0Yz6zprIgv2e3+Gm8Otd95twipBItGSprfpWmITMGY/C0WkC+Dq1
 fy5S7HrpaQX2yi21H4zuVucKIKVPqfdNVg==
X-Google-Smtp-Source: AGHT+IGptaavLwH1Dc9wotHLaERV7rmIKx8zwsAeWYcGLjGx5ZQLyvTyr/sBJpR5Y1q/a1+GCbCBqA==
X-Received: by 2002:a05:6122:2220:b0:4b7:1d58:49b8 with SMTP id
 bb32-20020a056122222000b004b71d5849b8mr1466875vkb.25.1704731609807; 
 Mon, 08 Jan 2024 08:33:29 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 eq15-20020a056122398f00b004b7483f6a18sm24661vkb.6.2024.01.08.08.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:33:29 -0800 (PST)
Date: Mon, 8 Jan 2024 16:33:27 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwj10BnNjMUifPE@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-2-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/10] counter: stm32-timer-cnt: rename
 quadrature signal
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
Content-Type: multipart/mixed; boundary="===============1592865318596583458=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1592865318596583458==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rdmwjTK3ghE0dbDW"
Content-Disposition: inline


--rdmwjTK3ghE0dbDW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:17PM +0100, Fabrice Gasnier wrote:
> Drop the Quadrature convention in the signal name. On stm32-timer:
> - Quadrature A signal corresponds to timer input ch1, hence "Channel 1"
> - Quadrature B signal corresponds to timer input ch2, hence "Channel 2".
> So name these signals after their channel. I suspect it referred to the
> (unique) quadrature counter support earlier, but the physical input
> really is CH1/CH2. This will be easier to support other counter modes.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--rdmwjTK3ghE0dbDW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwj1wAKCRC1SFbKvhIj
K9TLAP4lcFVt469l32BkPkqH/MtsvPu9cYickkeI10y/yKNoIwD/ZBIK1C6koq4C
SsQkop/uhdo6JxdLbMJnkDRzlwxqyAA=
=TSm1
-----END PGP SIGNATURE-----

--rdmwjTK3ghE0dbDW--

--===============1592865318596583458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1592865318596583458==--
