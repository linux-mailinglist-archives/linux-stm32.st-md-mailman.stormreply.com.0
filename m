Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9B85F499
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 10:39:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CD7EC6B47A;
	Thu, 22 Feb 2024 09:39:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AAF6C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 09:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708594741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PkSJy8SMxG40Y7D597XKNCZ85h9qerEH1l5wf9lzQ/0=;
 b=Yg+NzL1iWh21Ef7yH1jcM/H3SLxsH42Rp3mJZPsQ18SlQzBVW/U6DwLkZrd2j1N/B8LlCg
 XUA1PnxOfQqfEaFB4+1vF3opNYtukNCcpGTIMr0DUHujUJHIegntLQ9+VV/PQZeJy7D6G0
 yFqgNNWroNVDHAJn4feVirvo3mBcDKk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-v-LpTXluNReV0Hc8Xgdr8w-1; Thu, 22 Feb 2024 04:38:56 -0500
X-MC-Unique: v-LpTXluNReV0Hc8Xgdr8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-411e27d561dso16202565e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 01:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708594735; x=1709199535;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PkSJy8SMxG40Y7D597XKNCZ85h9qerEH1l5wf9lzQ/0=;
 b=PnqDGdY/ECOTkfD3Tu1duI/fIu5EyPSxIRZKWubUnJxbxmzCQxxGUx2BnUYDCzD4hz
 7g33NVFtsoh8+mVCANd6TeOV6cyijPuHttocieP91C3Lv4EKeqC8tRhQAJugtSDyCToF
 AwhYRCtK3Ba7gq7PoDm4JATyp6i/YpU3HB3XANb6tvBqtIWcD/K4mlKt9OHHuqOEVy1S
 Gz8qBiyXF4hXauJO79EtVCR7vPJPZM05LDfJgezdThvkH5kut2IEZ3yzXQy/S+T7zArn
 VgzDQNy7fhP3dbQ701rh57fSbjRuKf8bIg7QxNXQnLRqEo4k9lXMpwUNJ5d/ZQn7ScH7
 Gs3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZba6uYFTxSZGCSJV6mhmba6iyYFYdiOC1ziWQX1CvfELvqJpv2r/GKCxX9aRIbQjJDOwhauf96zBGY52Q+bLUvOe69IMAxZvx2Mf4OCbJUMZcDM4TgrUJ
X-Gm-Message-State: AOJu0YyPCFUjwTKXvpDyxe0H/4un9rqXwxADP8WBO3B9hkaX1y5dxNgT
 x7bEH/p4aZfUdnDxxGIS+Qurvc9LoPBfyk9YBy4De1u64M6nDh/X+pUUXROb7/YcQU+9N5aeRE7
 HrbyAdCtgRfAzJSwHK6LxBB2NGgqE17vu+mAYWg7duWrd9DFdZ3GKRDSO/bzefTr9fOHQwYSOhh
 kHqg==
X-Received: by 2002:a05:600c:1ca8:b0:412:52a2:bd4e with SMTP id
 k40-20020a05600c1ca800b0041252a2bd4emr11689183wms.3.1708594735320; 
 Thu, 22 Feb 2024 01:38:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMnKjbckCWhczRwAG585M6C2mhZOHxTNTdSk4rMneElz89fYAs3onf90whOGWwLN1Vun6v2g==
X-Received: by 2002:a05:600c:1ca8:b0:412:52a2:bd4e with SMTP id
 k40-20020a05600c1ca800b0041252a2bd4emr11689170wms.3.1708594734960; 
 Thu, 22 Feb 2024 01:38:54 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-224-236.dyn.eolo.it.
 [146.241.224.236]) by smtp.gmail.com with ESMTPSA id
 p9-20020a7bcc89000000b00412393ddac2sm5426873wma.6.2024.02.22.01.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 01:38:54 -0800 (PST)
Message-ID: <55c1527f778ada6458dfc3d626d36e5367886dbb.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 22 Feb 2024 10:38:53 +0100
In-Reply-To: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
References: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, kernel@axis.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: mmc_core: Drop interrupt
 registers from stats
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

On Tue, 2024-02-20 at 13:00 +0100, Jesper Nilsson wrote:
> The MMC IPC interrupt status and interrupt mask registers are
> of little use as Ethernet statistics, but incrementing counters
> based on the current interrupt and interrupt mask registers
> makes them actively misleading.
> 
> For example, if the interrupt mask is set to 0x08420842,
> the current code will increment by that amount each iteration,
> leading to the following sequence of nonsense:
> 
> mmc_rx_ipc_intr_mask: 969816526
> mmc_rx_ipc_intr_mask: 1108361744
> 
> These registers have been included in the Ethernet statistics
> since the first version of MMC back in 2011 (commit 1c901a46d57).
> That commit also mentions the MMC interrupts as
> "something to add later (if actually useful)".
> 
> If the registers are actually useful, they should probably
> be part of the Ethernet register dump instead of statistics,
> but for now, drop the counters for mmc_rx_ipc_intr and
> mmc_rx_ipc_intr_mask completely.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

It looks like this could target the 'net' tree. Anyway it does not
apply cleanly to 'net' nor 'net-next'. Could you please rebase &&
repost, including Serge's tags and explicitly setting the target tree
into the subj prefix?

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
