Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A523E87409F
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 20:40:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CF10C6A613;
	Wed,  6 Mar 2024 19:40:55 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DE0EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 19:40:54 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4d33a041ebbso1321324e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 11:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709754053; x=1710358853;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lLww44fHzXJw1Kt8CwXW/KAA0YiI8Bp1KLHYfbruk68=;
 b=btL12HIO3cAeQ9KtP6WZHewfMQDpT59ATwtrkoZydyDzbysC+TDzq/ndBybqmfNy7V
 f0o8lJb3ppp5FLcWqaGLfnUEsWpYWLYHXJV9K+wTy+djQBDNbHcumz2ok02Rb5QudPVC
 W0TFwBLyEBNbt1f9SAtJXCHwbQgqxTcjxdmzhCr7Lo1M/XVFcKn+1NoBoPWBMq1iNkjC
 zBSxY0ro0DCf9kszpBdNZh9IVBC7IBzEtMaZW2SOzL3yjt8nFuCeuxycAquD/5VeRQP2
 87t/39TN3Tmmaah9J21XY0rIHPv0ygBCka7/3Bs2GBQzQV999VEbx7Au2k+PTELF6AMu
 cK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754053; x=1710358853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLww44fHzXJw1Kt8CwXW/KAA0YiI8Bp1KLHYfbruk68=;
 b=F1XnIr9Hoy+FqRVJc5JvlkEgiK/Mfjygk+pJ46dCHBIwHcVPbr1C1dIB4RxFn2FRyE
 mYkWKeuGSAmjlxfVXx5q/3irqR6RchTfsdhGZjZzjM9VurfVysRIhFghC39cXN/bBqrq
 seJfl9Z310U7J7M/eN7CIO1HcwiP+nbDBeYYQaFnMNcfmuy58QUOwI7W1Kv58Ruey53A
 BqFN2d5JsKHvU/1UhElA0TQvkAv9D2cM1x840ssYcDKOxvyF0ARhLL20IV38AclX+vdf
 AjsURk7nfJYX3dJ9W0ivkEQtD+MBanhdMdrgEdeFhitt9+yFOVxbn+dwD7eAdpGt78if
 H3YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/hlnMvzyhKzVhtS2yGQgmgVvXdT5k8a1lGmClgYevhASczoYavOVd72sEY4S5hDdQoiwfiWZfS8toNM3jpOPJQCar52uERqZernMtZ21/ILMLjXWvH4cI
X-Gm-Message-State: AOJu0Ywkva5zZKXptwYFUuWndN8Fo9Q1EhEVj3cbQ/oubP4NW/bld1T2
 uTLpeINDn2bEJDWR468kTDwQFt3BKu4LaBstUVC0yXM5PAe8lBreyh/JDgYX1cU=
X-Google-Smtp-Source: AGHT+IFX+X96b30F665Z3v9XkkXlmdpro8bRgsJ4O1L64Bn+CTNhw2E2bPqB2AjrkrHwsVj2Sgb92Q==
X-Received: by 2002:a05:6122:49a:b0:4c8:e834:6ce2 with SMTP id
 o26-20020a056122049a00b004c8e8346ce2mr5202856vkn.5.1709754053042; 
 Wed, 06 Mar 2024 11:40:53 -0800 (PST)
Received: from ishi ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 n21-20020ac5cd55000000b004c0460eeea3sm1641635vkm.43.2024.03.06.11.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:40:52 -0800 (PST)
Date: Wed, 6 Mar 2024 14:40:50 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZejGwl9cjNmnIEz9@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-11-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-11-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 10/11] counter: stm32-timer-cnt: add
 support for overflow events
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
Content-Type: multipart/mixed; boundary="===============0059363978561805809=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0059363978561805809==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AHJchM3hVcrGYiEl"
Content-Disposition: inline


--AHJchM3hVcrGYiEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:38:02PM +0100, Fabrice Gasnier wrote:
> Add support overflow events. Also add the related validation and
> configuration routine. Register and enable interrupts to push events.
> STM32 Timers can have either 1 global interrupt, or 4 dedicated interrupt
> lines. Request only the necessary interrupt, e.g. either global interrupt
> that can report all event types, or update interrupt only for overflow
> event.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--AHJchM3hVcrGYiEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZejGwgAKCRC1SFbKvhIj
K8/NAQDCuf6KLzSMo+Kw/cpwoHQZKeN+w6n9G+6YESGIsrFwJwEA0oJlwcWAw71G
bVtRni++MRNTj1R0wO9V3GCUC9ShYQw=
=UU4f
-----END PGP SIGNATURE-----

--AHJchM3hVcrGYiEl--

--===============0059363978561805809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0059363978561805809==--
