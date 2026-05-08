Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENlrBWHe/Wn0jwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 15:00:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2DF4F6B3E
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 15:00:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E48C36B2A;
	Fri,  8 May 2026 13:00:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B5EDC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 13:00:15 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488d2079582so21882825e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778245215; x=1778850015;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H+pzZMqcVNHrQGygvPeDFTp2qtgnGuqqJsXL+kRhHX8=;
 b=I2zYCvF2BIe9QrPti27vh2ehbRSm5VrRztVXIri8/P4tmkwjU/odrUQ+nCWBZDnKSh
 upZXR37LGBy/as2WjN90TCyWlQEw5M7UVDSnmk8pFnyTlCAunKITUC9tdztuyCH5bNBD
 lUYo+ZxCVaYct/dsZH0r2Nc+CSyOlLKd2OBHpevXwtusTwzUCQnRVX0V3ci/qpV88yge
 encLRJCOZ3pVAf4pj9VqIzY0/qo6rTxuMyCjCb9XbdltxI1AYBHluwzrEgOG7Hf8jJWl
 lw6SznzCXRzh4s7mpXTbizI95KQ6xt67uv4Bz8uvTG4E0jwg8X5VV1M3YPik7XEVEN1Y
 dfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778245215; x=1778850015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+pzZMqcVNHrQGygvPeDFTp2qtgnGuqqJsXL+kRhHX8=;
 b=rr61md80EX5gJzWv1fKusOjGKaaBMMgSf/7RtX+ZVaJ532QRTiGiLcSFzk8vPGUcy2
 OAC3cp0DDvSUjhpQEd/mAIFB7WNLV7VpYB9lXHwUxYy7WgfZIMjyi+0XOBBHReUKm5CW
 osxVspv6WFbf7ey+h/oDLYtRwpNu392lDcM0sf4GWm78n6Yx5yztU5UMBQzpJcizgdYw
 Ps7kmQhnVQQnHYRfbyFoV6Xecy/F8o45HX5BN9N8DVc1mK+V1DuKqIuT3g1QMd+EToFM
 nFB04y5SotzQaJdwROKdZEqGhspIx/kEfJSbdJxeAYk86jCrljEXu1DFP8Ua604fr6xW
 f5cQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YqOQ0rGhFLoykxtaUAwVKhkrYCXVHJ2z1P/20EbQb1rF4We6TNGsiqadBjy/ELOEzCtImIUy9sFRxrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMe1wWHWxxbDcA3VrMa34qRJhLQ+5cTlIvq8QW2YR3Andd3ZeS
 pMeryy9bAaQ961SrZeMvG+qkBI4gICXbwF6BR/uvDEtOXCx3RIpGdsZuOsxDbTkgV4g=
X-Gm-Gg: AeBDietPRnFrxPpkjPBAMfK+8Ii2Fe/oxAtRUtFpA3Cilm0zgxbGzsq9ak75hMnHcrg
 LU5e0zdOirctikMdhQ2T9glOJNuGGWxnq8FyMGOBktZJwxsd0TdcK6thH49bN/Qs4yw54Mn6Mn1
 KM+l6e28746+VYRkUSQdNE/vuJ/ZojWfj5MCqhya5iI4StfZJCfEa+iOGN6MtRONgZvu/pn5Atj
 WQQpsGPmT3HjphThayOBE31Pgtm93GZdUZOpPyHeEOqkOvossUXEd5p40sNTp2syzY8pI1YH+G7
 HP/DXdWj0VZl0BJhw/IAXU12x7/lKNAuzfK6tREAawF7YUier8dC5EWJ77z4jhuc3rIJy4QghQq
 a/P3Yp5UtZOw4Ev9JC2jTajTNPCDVUGg47Zs93fChclqxQiy9tKApVCNN7N46+nYcQ1qa8x6CSt
 SGZuhqHV2I+v0CSaPmMPEERr6aOET6xuD3tAVOos1nnH6d1KotJUjmin9DSkPTy7aoSQhcfx5Q1
 XlsJB0JU1ZyY84=
X-Received: by 2002:a05:600c:3151:b0:48a:7605:751e with SMTP id
 5b1f17b1804b1-48e51e0837amr191333725e9.4.1778245211651; 
 Fri, 08 May 2026 06:00:11 -0700 (PDT)
Received: from localhost
 (p200300f65f114e081c5a29ffa776f241.dip0.t-ipconnect.de.
 [2003:f6:5f11:4e08:1c5a:29ff:a776:f241])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48e65e10397sm18026095e9.35.2026.05.08.06.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 06:00:10 -0700 (PDT)
Date: Fri, 8 May 2026 15:00:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <af3eKKiCpf-pQDGQ@monoceros>
References: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
 <788319f0fff963feca4df3c5fcdd471dcf70ccdf.1776264104.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <788319f0fff963feca4df3c5fcdd471dcf70ccdf.1776264104.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1 2/2] pwm: stm32: Make use of
 mul_u64_u64_div_u64_roundup()
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
Content-Type: multipart/mixed; boundary="===============8416579315200317954=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 9B2DF4F6B3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-pwm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============8416579315200317954==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7hou7ppk2yrmpvu2"
Content-Disposition: inline


--7hou7ppk2yrmpvu2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/2] pwm: stm32: Make use of
 mul_u64_u64_div_u64_roundup()
MIME-Version: 1.0

Hello,

On Wed, Apr 15, 2026 at 04:50:13PM +0200, Uwe Kleine-K=F6nig wrote:
> When the driver was converted to the waveform API the need for this
> function arised but at that time this function didn't exist yet. In the
> meantime it's available, so switch to the global function and drop the
> driver specific implementation.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied this to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

as merge window material.

Best regards
Uwe

--7hou7ppk2yrmpvu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmn93lUACgkQj4D7WH0S
/k7wDAf9G+aiX3BQ2bfaYJjdgIEJkJ1uqMaChVZsHE8UfZN3lwXYCTUAYwwNHISb
fD7c8AMwVs8ykrkQ7Z7UiwSqDK5e8E6aE/aDbdT6W49ZyhqZG7DnkdF3HqjKDTgN
ceo7nqzO/ciAVBB+KAF80xsUQZoFoLKdDS5sYCyaib0FovUnKuEGhuUfzirtbJ/u
KW9RdGF8C+UyRsiVmugaX6YLGUJEzgaXADiXX2ndsUsbkTZkMfzMhjBAS9oRL8uy
wGLj57N9Aj2uF86KpC823E1pjbDt30kZk5Syk4AvoeA3Sz5atXsxkgJm6Qeihfwc
7seC079+uAqQdmiOAWnX7PDcVV0ChA==
=CTCc
-----END PGP SIGNATURE-----

--7hou7ppk2yrmpvu2--

--===============8416579315200317954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8416579315200317954==--
