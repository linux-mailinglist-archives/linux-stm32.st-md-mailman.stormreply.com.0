Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C797A82EED8
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 13:22:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 899C3C6B457;
	Tue, 16 Jan 2024 12:22:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F67DC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705407751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aKkRlw+9qItJOdXpLdHpbQMWwrj04Yup3l2felUeUNk=;
 b=ZG0DKIKUH52YwqnwpSmS14jnz3DLagEExAW0RsQ1U0u0qwf/H1Cka3rpcw4y5nCWWYAc3Q
 p3KNPd+55EvrWcux/+60C+/MzXH2lq97WBtVKdo3keegtPRv+NHe+wpgf7+mLLcOQxaUmO
 rkNiq2njRCDDGM3I60sEgKDh/oeLKsM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-s-8p2_i7PVKj-jlqL4ARvQ-1; Tue, 16 Jan 2024 07:22:30 -0500
X-MC-Unique: s-8p2_i7PVKj-jlqL4ARvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3379f55a7c6so572130f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 04:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705407749; x=1706012549;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aKkRlw+9qItJOdXpLdHpbQMWwrj04Yup3l2felUeUNk=;
 b=C5On9ABYw05/ToBO79/VV8sdecLSpF3bgCG5lU8auKWx3njorYCao9qT+giDltHriz
 q6E6/ZQK+qZNlfe8xzBLLEMwxp9V6sezCNbYRC9NOFJJ8wCYbTSI9rGvYDyeZdp62Uve
 ydrMPEt+oT6cvYBG3MJRzvtyWUiamNongfyEsADgjgxwdog/wfolY54sG98xHEaM3CLd
 C86C1sRinInGFwnmNsdcw2qefMzOHSOPB308r/wEtTTbW5QoKFBXRXwA0NUvVh0e36iE
 yWw+dF7QfS5yB7sngkWYQDC51a+ARLD8OGlyI0y0eamDl57h0SYHiUwoMw2LKTkaYQ7L
 yWQg==
X-Gm-Message-State: AOJu0Yw8H2sw2ouPmdQbn99DwAyKdoBNvpmOzlX8Ng9mJoHkyX8lsKt/
 hmoYe9YkbwFRejibVpO4Re6caWcogov5HQvsweXchLRr98AkvWe7zeBWoQKQ33hwgs52IJ6HhO+
 Z60X2B7VYNKssPsmequ7N0G2pndd8uwhu9QUkjsXiHpp9di5c
X-Received: by 2002:a05:6000:923:b0:337:2a0b:a7f3 with SMTP id
 cx3-20020a056000092300b003372a0ba7f3mr8374818wrb.2.1705407749138; 
 Tue, 16 Jan 2024 04:22:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd84/6POBkg40gVazCg+aIvqbtGccXWaCSo4YRcVhkOits6w9IubBrdoqZfFW8xNwdG2wL7g==
X-Received: by 2002:a05:6000:923:b0:337:2a0b:a7f3 with SMTP id
 cx3-20020a056000092300b003372a0ba7f3mr8374798wrb.2.1705407748759; 
 Tue, 16 Jan 2024 04:22:28 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-241-126.dyn.eolo.it.
 [146.241.241.126]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05600c46d400b0040e395cd20bsm22981924wmo.7.2024.01.16.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 04:22:28 -0800 (PST)
Message-ID: <f5ddf800df95cdce32637d41bc1539aed0a7b6f3.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jiri Pirko <jiri@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Tue, 16 Jan 2024 13:22:26 +0100
In-Reply-To: <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Wait a bit for the reset
	to take effect
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

On Mon, 2024-01-15 at 20:21 +0100, Bernd Edlinger wrote:
> otherwise the synopsys_id value may be read out wrong,
> because the GMAC_VERSION register might still be in reset
> state, for at least 1 us after the reset is de-asserted.
> 
> Add a wait for 10 us before continuing to be on the safe side.
> 
> > From what have you got that delay value?
> 
> Just try and error, with very old linux versions and old gcc versions
> the synopsys_id was read out correctly most of the time (but not always),
> with recent linux versions and recnet gcc versions it was read out
> wrongly most of the time, but again not always.
> I don't have access to the VHDL code in question, so I cannot
> tell why it takes so long to get the correct values, I also do not
> have more than a few hardware samples, so I cannot tell how long
> this timeout must be in worst case.
> Experimentally I can tell that the register is read several times
> as zero immediately after the reset is de-asserted, also adding several
> no-ops is not enough, adding a printk is enough, also udelay(1) seems to
> be enough but I tried that not very often, and I have not access to many
> hardware samples to be 100% sure about the necessary delay.
> And since the udelay here is only executed once per device instance,
> it seems acceptable to delay the boot for 10 us.
> 
> BTW: my hardware's synopsys id is 0x37.
> 
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> 
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Please have a better look at the process documentation.

No empty lines are allowed in the tag area.

A fixes tag is requires, something alike:

Fixes: <blamed commit hash> ("<blamed commit title>")

A bisection is not strictly required, you just need to be reasonably
confident about the the culprit.

You need to include the relevant target tree into the subj prefix (in
this case 'net').

Please include in the recipients list the persons that provided
feedback on previous release (Serge is missing).

I'm unsure why/how Andrew landed in the recipients list!?!

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
