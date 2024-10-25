Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB69B1327
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Oct 2024 01:24:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059EBC78021;
	Fri, 25 Oct 2024 23:24:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA51C7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 23:24:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-208cf673b8dso22556965ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729898690; x=1730503490;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AUOx9g9Hd29aDPaPnY4OSJGlF1FDFTub05boTsaeB/8=;
 b=MW4g7TvbtHv0CnZCDIvl7aKW2J5Jwlz8/cOUrUEOnGNxQXoF71/MEDQsrBkH7Z/e1x
 Nv76X9Fy3K+CG6GQOyz2Ru2XdHB7IvVvKst5hPD1JSK4PaTXGyapSjqvecZgN7yrKtBM
 UJQPkUBFq7fgM5F5gdieKCBCPHuDEtNIfYxYFvgi8O3FPAmc1IUkq1VLkkOjg67I4sfO
 tHg320iX2apdVQNj9/O/w0+VXF/EdRfvjZn8vcBCDxJ3Rt2hhT80MwSeJ/gE32uQQunV
 PbvdhcnjfirnN7xn2kE6ii3gLqBBdO44g2H/70dJHPCzhHS+dlMuu2aHP/YSaODZHeBz
 88xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729898690; x=1730503490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AUOx9g9Hd29aDPaPnY4OSJGlF1FDFTub05boTsaeB/8=;
 b=BqBaoWXfqaWr6b9D7jlh94YhuJ8xLQ1IPDzyJOt/w+UpKYdvGsuYotlAaOzCDIDZI2
 TZkNiNjwepsbNweD2ljCWzOt/b36lOsiSmEQOWJRfuoBvizjFM1QQ2Etl0iiHtnsxs7x
 T3/fNUx4+bS59sI/lDpo4dcHWCaacbhmNMqZg+ib9A8b/3CO3eVAHOTGAJAiUgFoyYKY
 eahtYqjDnMjyNIVVQBrL/dYmqiK4G8yV3L54UZ6wNHzkAlikzFPko2PFloz19f3mG56M
 jj3lZnSidqItXhr8LlmPAb27kTbL7QwEK2E//F0WL2Y9SjhI7AiEuuL40JfNOHCYfkR5
 GXDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5mW2MEVbMWuOJWetaWERwSPF/uq8VtW0ZuJqf0baxyzxtXcWda+JXYADP4nnynj9wHDCdOcmXXm16Yw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyAB71323OVWLoa+PHrNLKz00QGM3aN5Vq7oGEMQGVXTUR8IqMT
 nEo+/jOvUpkCp1AcBkTk+BPME9nRcKRpBsKZng2LoCn9GZEGdLch
X-Google-Smtp-Source: AGHT+IFWUkTXqhX/x2uKnWo19NThA/0At3qPgoz/DFagDTJ6IoWaouVLt4TY0P6cRpHC9jOKRPrbGQ==
X-Received: by 2002:a17:902:c94e:b0:20c:af07:a816 with SMTP id
 d9443c01a7336-210c6c0dcfcmr9231285ad.31.1729898689603; 
 Fri, 25 Oct 2024 16:24:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d311sm14429325ad.81.2024.10.25.16.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 16:24:49 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:24:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Simon Horman <horms@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <vslmecginak75lrgudcoltoarvi7pcge7qw4rljyo6bctx7flc@xpasjaasdkas>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025130817.GU1202098@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025130817.GU1202098@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] riscv: sophgo: Add ethernet
	support for SG2044
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

On Fri, Oct 25, 2024 at 02:08:17PM +0100, Simon Horman wrote:
> On Fri, Oct 25, 2024 at 09:09:56AM +0800, Inochi Amaoto wrote:
> > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > custom clock. Add glue layer for it.
> > 
> > Since v2, these patch depends on that following patch that provides
> > helper function to compute rgmii clock:
> > https://lore.kernel.org/netdev/20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com/
> 
> For future reference: patchsets for Networking, which have
> not-yet-in-tree dependancies should be marked as an RFC.
> Our CI doesn't know how to handle these and we don't have
> a mechanism to re-run it once the dependencies are present:
> the patchset needs to be sent again.
> 
> Also, I'm assuming this patch-set is targeted at net-next.
> If so, that should be included in the subject like this:
> 
>   [PATCH net-next vX] ...
> 
> I would wait for review before posting any updated patchset.
> 
> Thanks!
> 

Thanks for your explanation. I apologize for missing these
rules. I will change it to the right title when sumbiting the
next patch.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
