Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3782754D
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:34:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C85BC6DD66;
	Mon,  8 Jan 2024 16:34:59 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD4DDC6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:34:57 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-7ce4512cc24so326642241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704731697; x=1705336497;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aaeb09tWE1K+nwOrTBr/Ka6fbm31sgc04gxFPmYXCe4=;
 b=vJBj+MTc7VaMPtBaYk/OMhRrcUNW1QVik8JBxWkdQ4NRWEb3BPxxGyVjx5R9SezEZE
 GG2s3KHT/zHiFIPD+7hTeSeHzLl8+hB3/t8r08ThkkyMTaj8TlfPHQDfrr5RZU8EivS8
 vPqFtd4AU9nyCkvOOQPl7FUzNxtYE2hPHzfAhYlocFGIkOKp1+G4Yas6k4xOvWwQNDcu
 x3xKftJrcKZQW5YCoJ8rjLqLt7m1zsppA7YBLl7/HLJq/uzyF19JGkdSj/kHeVQ16Vm0
 aHmOUOmMQwxgPKD6FMqkxhJT+JaobE65JlJvKsgMuhLrTivcKh7FhIdKn2RdpawxHZ2r
 EtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731697; x=1705336497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aaeb09tWE1K+nwOrTBr/Ka6fbm31sgc04gxFPmYXCe4=;
 b=F3XQ/us9vx9//aCS30OZSh30Fn6sn7nXeJVhUXQMok6BTy9I2wBL3kEp/zTN0KkuZF
 M0/lRFte/G5Pd6SqP97NELA+y5dRv0u6QUpRH+yzpWOHs5+eqzTKoogLeuzlD+mKxiNk
 LSpAf1gjKUFDmtCd5piWX1noO3CtRCA2cw0OS1xClQuqspk7LdEoj70kYjvZxubWc/0i
 olndep1FdUZYuT0fNMThC27GW/w9lBKQwFZDM1+8xhgNoYIdGKh5DEJwCEDhdHo4zsPS
 kMuAsm389/HocTcBMcKQXB5Kzw4qwFtU97OFsVeC+8onPadlrAbROmI7IxzQ7EpyROdh
 NZ4Q==
X-Gm-Message-State: AOJu0Yznohcw935P2j7s7TtEqZC3FPYkFORrCx6lAmOzwRH0HK9vJlLM
 sdl6p6falWzb64vmlM712FZJU/Bn22v31w==
X-Google-Smtp-Source: AGHT+IGQ0arLRW2+JcH6xmHwAlc+Cv6QrAiA3W02JuecyXKxM31mvSYE9QkoJVTjcNvoa88gdfyFQg==
X-Received: by 2002:a05:6102:4b87:b0:467:1786:6144 with SMTP id
 ic7-20020a0561024b8700b0046717866144mr2027372vsb.30.1704731696796; 
 Mon, 08 Jan 2024 08:34:56 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 i18-20020ab03752000000b007cd2ad6e1e0sm14811uat.38.2024.01.08.08.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:34:56 -0800 (PST)
Date: Mon, 8 Jan 2024 16:34:54 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwkLhQZsL9RPuWt@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-4-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 03/10] counter: stm32-timer-cnt: adopt
 signal definitions
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
Content-Type: multipart/mixed; boundary="===============2524985599374072323=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2524985599374072323==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2A3cd3ictZgfwlWr"
Content-Disposition: inline


--2A3cd3ictZgfwlWr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:19PM +0100, Fabrice Gasnier wrote:
> Adopt signals definitions to ease later signals additions.
> There are no intended functional changes here.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--2A3cd3ictZgfwlWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwkLgAKCRC1SFbKvhIj
K/5VAP9dNxQRO/rMnLCWzROjUOk/Yef+aY3rTJDWSCLMEphZ+gD/b4LhAHIbnPCY
PxZZZd7COd6FDzoCqPsZKQ4NM47JYw8=
=hX0c
-----END PGP SIGNATURE-----

--2A3cd3ictZgfwlWr--

--===============2524985599374072323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2524985599374072323==--
