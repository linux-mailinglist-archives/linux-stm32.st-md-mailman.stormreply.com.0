Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4499593C9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 06:58:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52193C6DD9A;
	Wed, 21 Aug 2024 04:58:53 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9DB9C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 04:58:45 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-44febbc323fso32524211cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 21:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724216324; x=1724821124;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1wedJG/Bg4x+50/X/HHJc+xQbgaNB+dhizweD19x0U=;
 b=WLK0O8pClXEV6z8NGBqlEG1wNFN/mPI+wrRY/wgRhrm5p+K8iA+UVGQNoXajdUy5Nq
 yzzklx5LMXOxEsHBm1asghEt4/G86bvqNCEKeNGoTwE0M5crBgBSaDoXMNphNeLe3mpP
 XA8wOaxtA7AeBvgL0uj3fgANczFQL0Z4AROm9DsmygEke3QtXlg9adJCqjsbL0qRQylJ
 RV3U03F04wH5Dr698oH2KpY9iGsmWu42KigHNc16CQdKdqfj/FYGCTJnrAXiWzncekc7
 ikM7za5T7CB/rWYUGzingex1wwisTBbR4d0VPkuLfVW+AwIu5Uh87PtvGBVfRCzsFD8E
 07tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724216324; x=1724821124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1wedJG/Bg4x+50/X/HHJc+xQbgaNB+dhizweD19x0U=;
 b=KcQEGOtVDSmk+0QarklQm8wIbwRmf63EatJzdfMNAiDb6pztTRGtlY2Dh9gO0XcyK0
 2wtC5JFCGrllWFHl3Jr2S2RaLMwKo4yKLG8k9B3R/ncoM0YfPGxfpEA9OqYyWtADt9vr
 GW5Ny5rrT+czcwPwvRrBNVfRlktyB6BUxQUP/Jh8AlwEh1pQnAUddTljQjGcIl0HGdWL
 JPQt21kJLMpgjdGwOC5jtCA+PIXzCjvLfZF/3w+9uey5MB3pjd8zZ4McKQc9sMGMizOj
 xkZ6zoytZdmrkEnC/6AK9cBogG0tcrb4LDjfatkV8OFv48cAhkEM/Mt4n9+WFmgHAeJm
 H6qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfdFbPKVtG9CHN0/imOWEfF++qDJg7fvzj2S0QGZVQ6eLNYLKEHLfoGouZRrjQkiK1Ti2eiLpijCbLAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTQtiGPLZxDTpdDdlEoCiSoeO9wsgc4Kc2tDrQXTfgnrzJfHIp
 Q8Rpcs4M5v3ferEEKnP9LCGbS3HHQnhdi8RoCCdY7/d6e4VG7iQx
X-Google-Smtp-Source: AGHT+IGBo/S81CZz7j4bai9R3gFPYkz5tE2gxC9VhQUqFp/OT85vnumLFVbQZK7aG2h8zR+dajr5uA==
X-Received: by 2002:a05:622a:4a13:b0:446:5a63:d68f with SMTP id
 d75a77b69052e-454f21ed913mr12368381cf.18.1724216324316; 
 Tue, 20 Aug 2024 21:58:44 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4536a0035c6sm56215401cf.42.2024.08.20.21.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 21:58:44 -0700 (PDT)
Date: Wed, 21 Aug 2024 12:58:33 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20240821125833.000010f7@gmail.com>
In-Reply-To: <20240820123456.qbt4emjdjg5pouym@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <bc4940c244c7e261bb00c2f93e216e9d7a925ba6.1724145786.git.0x1207@gmail.com>
 <20240820123456.qbt4emjdjg5pouym@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/7] net: stmmac: refactor FPE
 verification process
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


Hi Vladimir

On Tue, 20 Aug 2024 15:34:56 +0300, Vladimir Oltean <olteanv@gmail.com> wrote:
> I took the liberty of rewriting the fpe_task to a timer, and delete the
> workqueue. Here is a completely untested patch, which at least is less
> complex, has less code and is easier to understand. What do you think?
> 

Your patch is much better than my ugly implementation ;)

Some small fixes are required to make kselftest-ethtool_mm pass.

Would you mind if I rebase you patch, fix some small issues, make sure all
test cases pass, split it into two patches and include them in my patchset,
then send to review as a Co-developer and a tester?

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
