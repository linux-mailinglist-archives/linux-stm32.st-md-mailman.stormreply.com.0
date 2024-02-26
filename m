Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02C866E34
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 10:22:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9035AC6B46B;
	Mon, 26 Feb 2024 09:22:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8336C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 09:22:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33d32f74833so1603728f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1708939341; x=1709544141;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j8XfaiFpFxA90a4LK42YXfNdmNz9AouX/NgcsYVPG08=;
 b=qZQwWsIsHqnK09whMAqRS5lO+CuiAAi38oSGPBvfEyvcNhaIKHPd9YYVlHftGLaDE7
 n+q3Vb6eGDj754EEKJw4MrMtzYRUCnK4EtE8tGtADMHhxQQrNbU1zhTxP8PUd0e8MMkp
 ImtKrQ3gECI7iTilaOQL2HZOD6owlICBey5PArrUFDil6I7ihOIO1Pm5U2CzjfKdAdnv
 6KEGAAyfnK99k/wSL28eZqF7PO/B2quutIBCh//fTRJ5iHKtNWcrD+Rqf1KfWks3T8tB
 V0Z4RkDrCaymTpmdmzbeoHz9Gs5ROLTyHLHCeoZwqcNsii/r6AVwcHodqyCD2DHCR3QI
 P+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708939341; x=1709544141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8XfaiFpFxA90a4LK42YXfNdmNz9AouX/NgcsYVPG08=;
 b=XkysS1Mrl8zdSEm5hqTXAkwhr9deiNe/tuPA5oy4l0MprkWf/YhLg7YbjlTC3JLr6Q
 t4a7JhNIrvp/NTF6T9gHi58euQrvpwxRFwDB2eSfV5YW1f1XNO2aBZn6N/ZwlYVwaAnO
 /cWRNk0MKxr64rzEDtvuOrJpRAHl7GfQHV5FoTa/16S5LMLnkVyUpujHuOuaePEPlXEp
 TyFVNYNgMHEhIubbhAE/F2qghp8yjnpbZ11WAGafQZ1zDT55gthXhuJTHFGL+JKSGIPr
 savDMao6zDytv9+3O+sfDkJ85eITW08dJgYVd0BvJ1rMCK+uBUqmFTBfXH+OW5e/BqLU
 iKwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtKabakpf5qdxHys8oT+ORlOj5OBSOUmHm5UZBsNRM+j4sImfO0m0BG5p9PjdK6YlIKkgrZiCnzUKNeJzpsTHhxwJNKkg/TP+FONTLrZVViC1BF7t6x3Cq
X-Gm-Message-State: AOJu0Yw2sQwYrwrZe6bZPrfQl46MWZnbj8Zo1Qsc7wZHHfsPOPO9vRqk
 1aLhBYNEW48w2SDjiB7ncwr97rtmAUbtgJs7MrjFJjgYEAzeewSzD9obW3B1+Cc=
X-Google-Smtp-Source: AGHT+IFhByc7Z/s+hrcaeMhRiOLNXEQPUqLbBOTkrI67qidhCeOFDFWtzdBsTN1m+Ij8d6SU/mQ3XA==
X-Received: by 2002:adf:e40f:0:b0:33d:a185:17ec with SMTP id
 g15-20020adfe40f000000b0033da18517ecmr4122739wrm.4.1708939341017; 
 Mon, 26 Feb 2024 01:22:21 -0800 (PST)
Received: from localhost ([86.61.181.4]) by smtp.gmail.com with ESMTPSA id
 e11-20020adfe7cb000000b0033d071c0477sm7605769wrn.59.2024.02.26.01.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 01:22:20 -0800 (PST)
Date: Mon, 26 Feb 2024 10:22:19 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Message-ID: <ZdxYS6Fmd6NLScGC@nanopsycho>
References: <20240223-stmmac_stats-v3-1-5d483c2a071a@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223-stmmac_stats-v3-1-5d483c2a071a@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: mmc_core: Drop
 interrupt registers from stats
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

Fri, Feb 23, 2024 at 09:37:01PM CET, jesper.nilsson@axis.com wrote:
>The MMC IPC interrupt status and interrupt mask registers are
>of little use as Ethernet statistics, but incrementing counters
>based on the current interrupt and interrupt mask registers
>makes them actively misleading.
>
>For example, if the interrupt mask is set to 0x08420842,
>the current code will increment by that amount each iteration,
>leading to the following sequence of nonsense:
>
>mmc_rx_ipc_intr_mask: 969816526
>mmc_rx_ipc_intr_mask: 1108361744
>
>These registers have been included in the Ethernet statistics
>since the first version of MMC back in 2011 (commit 1c901a46d57).
>That commit also mentions the MMC interrupts as
>"something to add later (if actually useful)".
>
>If the registers are actually useful, they should probably
>be part of the Ethernet register dump instead of statistics,
>but for now, drop the counters for mmc_rx_ipc_intr and
>mmc_rx_ipc_intr_mask completely.
>
>Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
>Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

[...]

>---
>base-commit: a08689109c5989acdc5c320de8e45324f6cfa791
>change-id: 20240216-stmmac_stats-e3561d460d0e


Not sure what this is good for...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
