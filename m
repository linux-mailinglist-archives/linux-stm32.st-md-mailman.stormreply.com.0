Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431A9A3218
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 03:33:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E456AC78032;
	Fri, 18 Oct 2024 01:33:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3ECAC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 01:33:38 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20c714cd9c8so16603575ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729215217; x=1729820017;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVBdQDKACdOFfREB0q18lZeDtV7666msm3xj7bJP8BA=;
 b=dWVI1PN1UMuKBiJW/X2DoQCpaBjek5xohI0IBAZrAuvJZFEd2YGnXfxFrLyYEmYNQD
 +8gMwoEzVSAWxGq1oqqt9YpfW4oPE5lakyciSFeYYX/d4/CyuxJrOKnvZB92N38ldbzR
 42tsS1hwnCvfpN751207DiHI/qwoXv7aNTg7nGIP1aS+cF/Rv/gtU42XzLzjMoK4niT2
 sv3Qxg/BRe3MXlGaX20DTezx1Lh+BywAM0gH4N72iU6903fqA+G7lMu9akQBTlry/zJJ
 gkHQXVL2q8zbg2UtOK5sI1ID4QuUj4Rq6VLpmbdJI+LusirFl6whdEZ4/QJkG+X7Altk
 dUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729215217; x=1729820017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FVBdQDKACdOFfREB0q18lZeDtV7666msm3xj7bJP8BA=;
 b=TcQx2mvrpy2V7p9eZtnahsC1gqqB083Ic6MZmVUvbWQGH3G88SSBJtLDIh0ipO24St
 X6JOa4mgZzA4AgrO7EndmaXaHFyvfJ2/PDPIbHILsvIhl20KZw1ihQ4RMnteLvWv3fqL
 gniwbrlzcYkyC13NlOcxAwohdwJFl2uOCFLcs8euLWer/R/ltOAOk+k8VJAyvi2F97V+
 T9DvA1Ndqw6C6lABPbzV4gKnTigfM9zGveCdKnYDqymHaVM9ww5gvnQcz2IygoRVI+51
 S3rkTA/RiQVidLzNBA3i0mGTu0u6p+tFit7KuKmaeY8KVrBlPLrG5XlO3K29noONc5bv
 RxNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk38zmiChyxCgkPeLJGJzdFklv30QrAQ95AmW3oqwNnBBQ1yasly0pXU3xyXBvDxhokH67ne3ZGmEcGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyxy4IzsKqx2fXWRmpH6tHWEgNiPh7Alxdo5DUiupEs4bey03ej
 /2IRGloVj6+6VVutvHh+LC+GGy+1kQAYHtBLlRK3g4iuo8Hhnx/0
X-Google-Smtp-Source: AGHT+IFC6olARW/9uK6g5ucZbqkJMfH64yjeQl8CUkL2mnBdWfULzMNx7BQa28+IWGBvzpdDoonfVQ==
X-Received: by 2002:a17:902:d2c1:b0:20b:6d82:acb with SMTP id
 d9443c01a7336-20e5a8cd3eamr14787525ad.23.1729215217024; 
 Thu, 17 Oct 2024 18:33:37 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e5a9136e7sm2583595ad.284.2024.10.17.18.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 18:33:36 -0700 (PDT)
Date: Fri, 18 Oct 2024 09:33:27 +0800
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20241018093327.00006966@gmail.com>
In-Reply-To: <20241017170652.jtg2abm532sp4uah@skbuf>
References: <cover.1728980110.git.0x1207@gmail.com>
 <20241017170652.jtg2abm532sp4uah@skbuf>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: Refactor FPE
 as a separate module
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

Hi Vladimir,

On Thu, 17 Oct 2024 20:06:52 +0300, Vladimir Oltean <olteanv@gmail.com> wrote:

> Sergey Syomin is the one who originally requested the splitting of FPE
> into a separate module.
> https://lore.kernel.org/netdev/max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf/
> 
> I guess you could CC him on next patch revisions, maybe he can take a
> look and see if it is what he had in mind. I don't care so much about
> internal stmmac organization stuff.

Actually, I sent a patchset to move common code for FPE into a separate
FPE module before he suggested to do that, and you gave me valueable
comments in that patchset ;)
https://lore.kernel.org/netdev/20240806125524.00005f51@gmail.com/

It will be nice to CC him and listen from him.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
