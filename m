Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHeXNcp3BWoaXgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:20:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AC53ECF1
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 09:20:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B622CC8F290;
	Thu, 14 May 2026 07:20:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDC0DC8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 07:20:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso63683075e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778743240; x=1779348040;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
 b=O5k6ZkZoiSs6sWV1U/qtJR3gc38k5B/cglquB9iyTjquCfKyy3nmy1+HgIHflxdtj5
 4303YmZ6xMWSv8KENYwj+5KxD+fwKfGml9k+QSPNpF1DE23B5qkBzLrsglODzh5ZCkJD
 jO5Rax+BBmV8DjBDWY00tmwFm+NM1nxV0m6iWInn7r1tvo+n0HdrZbvUioR/Im9JpfsR
 U6AVGlijYPX5DUginBf/traF3txHZQFRPM8HuehkyCZ/bJztx2ZEs7eDn+Ix6PWRenOy
 pYhAjBSY+IAg3eCqUTK9La3iid4Yk0Nml3AnVcfY67g03ZpbN3boLAExJ0zE4X/aFzNE
 73SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778743240; x=1779348040;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ojBKerXcsom5YLOUywnRgFuJgAkEyWjWD8C2JpwtbUw=;
 b=oUru52NEMIdtXEpKqWKN13W6sWz1RDVaCagn73uK8rW1lp7rfiV00ayAmQCPMyyCHD
 w9/7EVkg4O4XXv1eX0pogr2x7oavq1VbBGmU9b/zbnDowcp09qtcRRmkLq94riy9IVDV
 EwFIa/yqwK89SjEj0gZ2zR1nUFwbMey5hjkbyzyPqjyJ5lelIYWlAvj89mJq4AVnEz3V
 5wiWwsvQ8y9UEVpp/B5Ww14+PI0zjB6XH9MHgrGj7nVqzx5tYeTkeEz50Ssd8QAQyMnM
 jiUaCiB+nk+mzzKH6cD8VKD4e6nsgBedQN/nZ0Nw/5Wi8vJHorGD9SIFBT55iC46MZdQ
 RCfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8t9oJ05zf4wm7K2VVCmm/2iRAVdF2jpZhf7PEJHFn2Zjw9FuSOMpZN8Bfgcrhwomktf9qAIhxNxb/7sw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx45I5an8yg+Fs2rNEvc0OmLuq6KMmNQZTT8Pr1aesHowJoxgdx
 VoyfJKc6c4AwxgHWAa5uIwzCcPbXv9uOUc2Eo0N+ieLs34UZ39cLCg/3Wrxw9XBDgjg=
X-Gm-Gg: Acq92OF3afJt2OpIwSN0u9fTD9cLeFiH3S0JoX49w8jRBZJUAEaChgzMq6Bt4X8o/mK
 WN40sGZozqpJTk2qqFGto3xXoR7FNbh98INolZ6b7kv6yk09fWVN40l+bi4btGuzaWAUnK97mTo
 JoRk65jJ74fAx5TNvkKaNdt8E6+Jyq058DvpOMcfoN5/Ohtjm609PDEPghKhS4r766tp2S+4Uo4
 8tMLENSVJryq2pc0LOLcUaQLTAICzlbuelJ7KpcTQyvSytDMtMv81FK1vkiiTBFkFa6phkZH+Su
 1OiPr9pGiM1JjmqoPUavFOk8Uh0SHeW1Z89Ez2T2/haTe/7Tnc5Z7UB4Q7qEt5SbA8soknApJXJ
 JYm8cjXvcZTOV7kF5wCydqEU/8kUrc8oap2R8XKvJhWZA0PkOePZWLVXvJEQBIEG04BexrLVVLw
 3McEAYU4yLMH4e7+zhm1K0YZisnc1iBu8Y7WbZ
X-Received: by 2002:a05:600c:1547:b0:485:ae14:8191 with SMTP id
 5b1f17b1804b1-48fc9a02785mr93973495e9.5.1778743239978; 
 Thu, 14 May 2026 00:20:39 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fdc6f0ab7sm22461275e9.15.2026.05.14.00.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 00:20:39 -0700 (PDT)
Date: Thu, 14 May 2026 09:20:38 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <cabngw2wuxh7cfx4cw4ik46dmxs72u47jyo6hcwgdd7a5whny2@dsp4cysetarw>
Mail-Followup-To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
 <agTcoVbImqMgfQy5@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agTcoVbImqMgfQy5@ashevche-desk.local>
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Steven King <sfking@fdwdc.com>,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
 David Lechner <dlechner@baylibre.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 09/11] m68k: stmark2: use ioport.h
	macros for resources
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
X-Rspamd-Queue-Id: 813AC53ECF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:andy@kernel.org,m:arnd@arndb.de,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:nuno.sa@analog.com,m:sfking@fdwdc.com,m:linux-m68k@lists.linux-m68k.org,m:geert@linux-m68k.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:gerg@uclinux.org,m:dlechner@baylibre.com,m:gerg@linux-m68k.org,m:jic23@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.357];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,vger.kernel.org,st-md-mailman.stormreply.com,analog.com,fdwdc.com,lists.linux-m68k.org,linux-m68k.org,lists.infradead.org,gmail.com,uclinux.org,baylibre.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

Hi Andy,

On 13.05.2026 23:18, Andy Shevchenko wrote:
> On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:
> 
> > Align also other resource declaration using DEFINE_RES_.
> 
> DEFINE_RES_*()
> 
> ...
> 
> >  static struct resource dspi_spi0_resource[] = {
> > -	[0] = {
> > -		.start = MCFDSPI_BASE0,
> > -		.end   = MCFDSPI_BASE0 + 0xFF,
> > -		.flags = IORESOURCE_MEM,
> > -		},
> > -	[1] = {
> > -		.start = 12,
> > -		.end   = 13,
> > -		.flags = IORESOURCE_DMA,
> > -	},
> > -	[2] = {
> > -		.start = MCF_IRQ_DSPI0,
> > -		.end   = MCF_IRQ_DSPI0,
> > -		.flags = IORESOURCE_IRQ,
> > -	},
> > +	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
> > +	DEFINE_RES_DMA(12),
> > +	DEFINE_RES_DMA(13),
> > +	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
> >  };
> 
> This conversion drops hard indices, would it be a problem (for example,
> some code modifies the fields based on the [hard coded] index...)?
> 
> If not, perhaps good to mention in the commit message and move IRQ to be the
> second one?
>

i can't see any directly-related code accessing these resources by index,
so would not change this if there isn't any risk. 
Also i see DEFINE_RES_() stuff widely used in other arch, so thios make me
think accessing by index is something wrong.

> -- 
> With Best Regards,
> Andy Shevchenko

Regards,
angelo

> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
