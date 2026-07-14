Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /JZtISQrVmpX0gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 14:27:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1971A754857
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2026 14:27:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=cfe0XJPe;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C131ECA8E4C;
	Tue, 14 Jul 2026 12:27:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B72DC7BF97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 12:27:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so5231665e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2026 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1784032033; x=1784636833;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
 b=cfe0XJPesvY7IifSW+9TNbLdxwMDSQADTR5FElXPQ7xR0+KjVOEPv5Rkz+NUizFBIt
 95Ci4ZcSmtZGwzI0YHGrDgVvM6Kz07hz+HH7/Kph2FJLPO5FJvyqjnAVRh43P4AAWkys
 a64PYC1SeT6eNR7N65Seew3ND1RJUngRylSNEwrqMe467u+DWlaw2uGwVoNniumM5IIV
 rJJgFKH1XEpiojTnwn6eQ70M4DhWjh5VJpjcNokxd4jSrYIJTiKha+0evruPhVaLhQyB
 bMnw6IlPLmPdGv2QW/pypF33K2NR7VKXtpnhKtJk6sAvwtmodJeQ9AZwqAzN7HNJfLgj
 P4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784032033; x=1784636833;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
 b=cQ32EfexyluA4p0vJPo648YbS6mA53xruDcSKp4sRu1/VQgoYv8b8Ueyi456QRVOAv
 zX4UP8uGbi0aD1Mtn6NSJ7rxdKKB2j2odTvQXdkBkZWVWhIYF9j/85h+vJXzWxBsBPg/
 MecndO0bYOGm/90UspwVpVTYy+Pi97QLHzgcxgfzfERrpEtJZqThtqNM76HNPxB0TQAE
 ECrEkcIHy/X8j5ph8RNAOcWjAUQWKIXq6yjQvCFqV3fP5Vaxubn4Oo5uiannnNZQ4Lo8
 uy0HXZVNOiiOZyxXSMWfWOniCrQyXycZo6GOVewt6sswrWRGAhdl8ydLDwZrCX8/bwIt
 Ejvw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoU/9WjXKNQ9rMpxdCdiwVj5biy6tkEJDqGnT1L+BM+aLEfEnvv5S0qKgg9sEv5IXIjwPi4jq9q/6rK+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzp8y6gVAQHfJWTOqkks/C8UggLd0gzt3k+wW9xlA9uRsSYqkct
 MtNzoUnizKNa6GdgqOCf1+Pjn/9bVaQ7sj1EXLtLcsBAuEhc79luBhIfwvO/6gxwFSM=
X-Gm-Gg: AfdE7clEQyfBRfBlbEeLFd5x4uS7jmcDAtTjfGG2d9tXDYxqdHytBbmCAhCnDYGyULF
 aeHKhaf8v9VBmoS/xFwrwM2yWrsJUBajBPogkAu5/SV6gZPna0YBGbB9aQ4iZoKU3v/W6puOYJS
 nwtizhb6Ag2K+NyDDQ0kt3aEqOyW9VMNZ99Vk/uWGOM/0W4dZc3TVL9qaZQCjiNVUqzwjoJvK4E
 usYQ8mwQB5ehdebPqpOSxpQNlGSnUoGLiQmJqNiTBqlJSIZG/3tEMSlAwklZJdg0D+5NmaxURn7
 SrstwoKvNjTvxuMhJ6gvmk3tk3w41Ek4gx66y5IhylWW1c9a7RLv/WuvQSkUw3IFkvSRUq09rlC
 4lZKWTA/xjIDfqUpfNKYuy5ojmkbVO/knckKnrpcTFxJZ7K/Yl39kTQJHdFJ37u79FH3zsHYmhn
 uWZWzvG4JBMApV9qd9B9vCDSlrHKNOsgRY/mYxUFiCAk2gCzH414wDn+j5knVMj6QvFgTcjQmCx
 8SseOgg+nJsypzKqr27eKb9sA==
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id
 5b1f17b1804b1-493f87d7fcdmr131894065e9.7.1784032033466; 
 Tue, 14 Jul 2026 05:27:13 -0700 (PDT)
Received: from localhost
 (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:b44a:8042:1173:aa03])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-49508732395sm71538925e9.5.2026.07.14.05.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 05:27:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:27:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <alYq2J6hd06g9XyC@monoceros>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 07/10] clk: qcom: videocc: Add video
 clock controller driver for Eliza
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
Content-Type: multipart/mixed; boundary="===============4689965334692527180=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:mturquette@baylibre.com,m:linux-clk@vger.kernel.org,m:robh@kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:bmasney@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:sboyd@kernel.org,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,vger.kernel.org,kernel.org,oss.qualcomm.com,fairphone.com,redhat.com,lists.infradead.org,st-md-mailman.stormreply.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[monoceros:mid,stormreply.com:email,stormreply.com:url,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1971A754857


--===============4689965334692527180==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebx5plxbs5ed2t4p"
Content-Disposition: inline


--ebx5plxbs5ed2t4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:23:45PM +0530, Taniya Das wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. The latter header is
going away soon.

Best regards
Uwe

--ebx5plxbs5ed2t4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKx0ACgkQj4D7WH0S
/k73NQf/T09jaRmPJhz4l6/RUqCHwddXVzILSJXm5JaBiJDO0DMQ7ba66QjYb4dl
QI1n/Dhb09P32uDl6jsczhMK61GxspOgLrFR2hBJzih+s41bXQ7uPoTac0gcaxYW
7ldbJEM2KWQqFfrv8evU5objg4VkaDip0n9ci9nt6BgjQpYrjjX2clnDM/0zDdp+
J8Dm1K+VIcHnIuhNQqi0ptZUQ7G6eoC2c6bWlZ6aaZm8kmv+yuRaMgI+u78AEzgG
aSj02assVonsMuBMLKWJt55XzGBjwDCaWmUdfxbvs8kPIqtPeP6z5JFX/FcChP14
2tr6zJZjaXuLYoEM5CwI84TE9YnOXQ==
=/t+O
-----END PGP SIGNATURE-----

--ebx5plxbs5ed2t4p--

--===============4689965334692527180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4689965334692527180==--
