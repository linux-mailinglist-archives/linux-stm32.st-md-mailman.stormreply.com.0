Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8E827632
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 18:21:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F35FC6DD66;
	Mon,  8 Jan 2024 17:21:16 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A647C6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 17:21:15 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-4676a37e2c4so457874137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704734474; x=1705339274;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZspM8ajCmHKs1p1EXAdq5Q/lVaLYsqAVwFloDCnQslo=;
 b=Oa75F86B5idGOM4y1FF+FkdboKRz9vcx+CT5ij6hZ0/EcimGGBq5saJLOIKchjDtvs
 SLZA9InGg/9peSV5e4mOUWUFDoJP6glEQxXlEX/6Oi6jA335CG11UGSIjDX7EbH4Gdf1
 4A384eaCNzBgdTJRfWUnUDznrjonla0MsnmtIVa4Ah+lRVw4YGBoch4PQAw1Zimzc28B
 TANT+Ly30OOWHQP4EaGbS3BqgLbHIgpJ0Dy5fvvBLPoboOAERuIzUC2jV0QY1+kChLj7
 UtzX2EuhRM7TqQrXDTF2eSZtrAAbJ1rijRncS26KU8wxzZCvolHk86cbfly1MCENKpBQ
 puqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734474; x=1705339274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZspM8ajCmHKs1p1EXAdq5Q/lVaLYsqAVwFloDCnQslo=;
 b=fjLs9FBywYnF0OVBROtCO9n+acjseWMitXhL1YaCEgkJdJAZT6Rq+pJHWqp+/FgPuK
 D8wLgLGwQoW5u1V8EELOxzJRSJUUeT2bVgwyxKceGrjRMAaQ0fCfOy04hYo5Ip1PAQg+
 pl4K/vEuo5MyH/eTbNOGBi63vTGQkB9/+s7dqrKkTXYan0+BEjI5GuGJTTWEBWwRvzz2
 nv6XI03l1n/IbZtbz6heJ2zYhAJ/RQ8enDiM2W5KOqUQsWzTBB+o0z5TGUOSSc15wnyZ
 0QEnU9vTHd1+EtbeIV3j54koWRX5EMDXDo6UJzLLyuqyM5iNyxoNVdQMZ4SS3TYp7FYM
 BVRg==
X-Gm-Message-State: AOJu0YzR3TMCKDAwYKHR83jARxrgyVA8ZLrCtrIo7jrIjGmhVzitQIJS
 pvP6DN+cMSp+K3wzq/5lTciMaVP//Gj38w==
X-Google-Smtp-Source: AGHT+IGTjXXswi02o1zMkJMWTYM15rRnnmTFCThZ4ddDiIq33W1KHzxm1R7JydTv4AV40yYLr1HXAw==
X-Received: by 2002:a05:6122:2526:b0:4b6:dbfd:f89b with SMTP id
 cl38-20020a056122252600b004b6dbfdf89bmr1495975vkb.27.1704734474077; 
 Mon, 08 Jan 2024 09:21:14 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 ee11-20020a056130158b00b007ce1febd008sm20474uab.34.2024.01.08.09.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 09:21:13 -0800 (PST)
Date: Mon, 8 Jan 2024 17:21:11 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwvB6+m0Zqn9ih8@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-8-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-8-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 07/10] counter: stm32-timer-cnt:
	introduce channels
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
Content-Type: multipart/mixed; boundary="===============0071673114774271089=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0071673114774271089==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rAMR63FHT8DTNWPr"
Content-Disposition: inline


--rAMR63FHT8DTNWPr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:23PM +0100, Fabrice Gasnier wrote:
> Simply add channels 3 and 4 that can be used for capture. Statically
> add them, despite some timers doesn't have them. Rather rely on
> stm32_action_read that will report "none" action for these currently.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--rAMR63FHT8DTNWPr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwvBwAKCRC1SFbKvhIj
K6SEAP9QD1Yp25uS0XO3CQ36ysN3V/FOYL1wXT84afqp73IEtgD7B3TRLqc08WKj
3tpytIRAvMJ3S2hohbR9EGI3ZjCfWgM=
=5MFJ
-----END PGP SIGNATURE-----

--rAMR63FHT8DTNWPr--

--===============0071673114774271089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0071673114774271089==--
