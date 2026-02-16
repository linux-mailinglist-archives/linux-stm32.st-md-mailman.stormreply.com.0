Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDHvOen0kmko0gEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 11:43:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE7142701
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 11:43:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E37CC8F273;
	Mon, 16 Feb 2026 10:43:53 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F921C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 10:43:51 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-64c31ca77b4so878871d50.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 02:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771238630; cv=none;
 d=google.com; s=arc-20240605;
 b=UQAgJKQiyOXltmzcAix96AMg7ZYifFQmabMOWbIklaHzZlShyOgWIUeerijt9ddioC
 rcENdKOJlIo1n4oAT7PYpfc+K7tNvTxrv/RnG1xgv2P7qDNGM32OoYXww9Yw1qw+V2Sg
 HAkQXLsQoUWBVdJ5ioysSIDVpwFrKH8mTJbbCtKCzHnUtnhNf6AUVH8gND3ZO5CVtueJ
 O0RYvKki5ZBV7wRMVoMTBkPND6n565pge1OGvVNyyRnoi4VxtTyKrxjlviT+WdPsKl9F
 jvwOV+plSF5EMVfbkk7BMCoB9FhJ2ZChaVuY7n/NAWEl3qcOCCvhRULqdpktLAx3+GWk
 TGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
 fh=ZUhpMqMcM+J0AjBf70puMLrlyY/IRtiSmFfprRYL5pc=;
 b=aVGigV3Wm0NNJZAw/hA+695CVn6w5/vLQqZhI3cPpUexzEBSq15Vy+yQi/Ai3vaZdR
 OPNd6kCaf0fnI6BDwOsi5DE8yAdarftbm0ztd6wYioQJH+uYrU/5kS+Mna+dm/uSoOMI
 UhK+cpETfMkJ5NG3ekhJq7gTAZR5pyhxt9dDi7hMvaeDZ3p6YwdQ2eRjEqJ6xjIVxcsp
 pKYKqbxydJy9iHlFGIojq6d7lv0dLC/p0g4FwpAfjShpOB1FcFwEqKh3k4xWSqaEQ5JO
 WPkwnKif5kvduZ+JS+Gtdau4QNTBXelitNxCWZYCTrmKE4DB4YNWMLEaX7ZyrgZKEmPC
 UQfQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771238630; x=1771843430;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
 b=cMCXDAF040hxvuhry8FT+PrBA1et2C8UarHHE294l4ZhXI3lX+HbTLmz26MFmldQCI
 UeOH4OdjeVOoECr5wVNC7kSovTY8mrVZutacORVHAYVIXzCnB+PBtmFdb8sp2PmPVsAH
 +5gjtyUuDfuZfX3w76P1fgkUTDW5NaWn0A4EyD5S9BAn0F09+p7pt7k0kxBhQm+hnBlh
 YNR9PjOE3CxcJPay41EylTJ+fP8V0iy5mUkjOUgJ61mgXypHqSpproOLbj7bSm3kBrYv
 zWvGC4kq3xZnURvfxxNo9WBn2HW6zn4zk7Clu6phu3LDnrJLcnFtg8+I2le4ryONeXwi
 Rwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771238630; x=1771843430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVFYXNZ6okL6YFmTe2rDD9/sBQsf+RLu5VEz9wgQ6IQ=;
 b=rIkXPBPGZbvZPwuO5u+AbsRPlYDc/tsCdEyWDdmRPIj8vBuI277F9eEIfoi7hphl0O
 QxwiPGUPwXLXroIxg/V/tH7NrLRgTVNqu3G7lsvq3jVvfq3dKDL391zb2SlqVZ+H+lA7
 GptxMzeZgywyVMhhMu5Fk7qLlLLpbiaM0aF+zFlQa0fhMgLWrESunjZ9uCoAvoSNLP2I
 VMQt21ils/CZzUjASE6OMsQszRjGlVavfUKqJlRIJ/ROim22dt7vXkSt3j1xuKnyOmBE
 GuEFLIGQ9ElmKmNMFe0s+gtmRTeoVz/2QozPq7n1TX2z+DDLVY3vPMchiGWK0euF1AGL
 zfvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWANCxLwNMq0q5ck4vUr/gEHYt05fNnkGt0hoV0MSav3Uv0inrIki3vLOvrqNi9dXuj2yivpxGxSyIPGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4glD+X2NhIyonR8Q9AinXszPcg5XYTiVYOXWRXf0JzzUZUafc
 W8TLgsGp62DGoX8pFEOe4jVCAObML/TloLkgtdICdJW7xoyJ5JYi2vGvBRGDBfIY9lK9AUxc9dG
 g9gr6O+7RxT4pdh+aEh3gle7QWT8+L7jmvKQDhMecgXMeX1WnhNzBbSw=
X-Gm-Gg: AZuq6aLvvB3gd9abGi+cd1g9aCrwjFL7IRnXSOfNEvXBSNlWE5Nv3BBNKFbdydzQJab
 bf1ZcPZjzdgixWC8behJlomUN9PylC45/OEC0sy8/L2b6SSGeAtbX21Q/In9I/MkBpUkrJ38g2z
 XPe/ETrQX4Leyd7YclDtxCXYSiiEYvvS3OTPc8huuPId9G5tGl0igx+otHeyhl3hbMEyvgXcSV0
 rLGnughOM+LZ2GlcH14ynnM4m6WzBO0GDq4CSkAQ1OcKpjGw27LjKeVMway3UB9gyjnsxb1n0lZ
 kQaYkphwFvWJDmhu1auZF0n7sj4cnS/MMeV7koWwR8//qJ9/jp+Fc9IphvhxyGdFHlL0a/gHY/X
 I/v2p/4d/PL1BKnz5a4M3UniT4qx3VOHi6kw4YQjMeEfbO+ipJdoUoL41nR80+tQh3rU9zK4TN2
 c5nqNzLSF8D6Bid3sBkU0+WAoC0Y7P6HGbGrszGbv0g6eBFIsVvxeaCjo3SK4jNjWJc55XmIVEE
 Yirp0WLX/dmFJqh2zBP9ttDwsWo3IFOGzVS8kaATTeFM0erdK+VKLtfDV4Stwe6sqXSoAZ3tmJx
 LPdonX/Y1U71IfZhxbD9Me2P52MCnIGOq6nFdaqSiAe8
X-Received: by 2002:a05:690e:e85:b0:64a:e9cc:6b79 with SMTP id
 956f58d0204a3-64c21aa6bf8mr5891327d50.40.1771238630231; Mon, 16 Feb 2026
 02:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
In-Reply-To: <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 16 Feb 2026 12:43:14 +0200
X-Gm-Features: AZwV_QhZk8Ve-HVG4LywC7DTLkrzaAYTYg65ke5EPTaHQ49aWW-D7iWhOjZaNwY
Message-ID: <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] efi: stmm: Constify struct
	efivar_operations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ilias.apalodimas@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilias.apalodimas@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email,stormreply.com:url,stormreply.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 78AE7142701
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 16/02/2026 10:49, Ilias Apalodimas wrote:
> > Hi Krzysztof,
> >
> > On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> The 'struct efivar_operations' is not modified by the driver after
> >> initialization, so it should follow typical practice of being static
> >> const for increased code safety and readability.
> >
> > get_maintainers doesn't include me in the cc list?
>
> I use only get_maintainers and as you can see no. You might want to add
> yourself as maintainer of this driver if that's your part. Or have
> korgalore/lei filters.

Hrrm, that's weird. Running it locally returns a more extended list
which includes me and Sumit Garg.
I'll have a look on what's going on.

Thanks
/Ilias
>
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
