Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1839AC962
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 13:47:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D11E4C71287;
	Wed, 23 Oct 2024 11:47:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFABBC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 11:47:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4315dfa3e0bso8740965e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729684069; x=1730288869;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OgbVi/i2e2FmnWnQxf8m0K4GdKARclUd2e4HuJyv40I=;
 b=NRJTmkInVWDMznvPT2YxQV1ZUVi78tK9sbdNbOZLlTfCkgY6Zg80Wey6prnPDlL9Cp
 EfGPo+N2H516hy3R/4VexoLzOlbeLGHB04YjFtcKmGaFX5eQVmN1+GDUrX3yuoeFGzmd
 3CAv8FlvGT/GCZ4HsqxCrUOj7CDdB+BmUqgw9BPYqAN76dWdx8va509LASgTWV7QAWxj
 dnlOswvoFzJvAkc3Qjc+SZz+FobZkZlQcgbzu1y6SyW/mdW/X7aPO64MN3jkQM55v2P8
 FbXZ/jJKDpbJeIlZWBq1sfMYnz9hZwau1fAJxUXpis6P5gduDjZtU+1qN0odAZJClFcF
 rSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729684069; x=1730288869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OgbVi/i2e2FmnWnQxf8m0K4GdKARclUd2e4HuJyv40I=;
 b=UJiLXK33ZUTNmFKKcbaCCzgBFRoswS9S8E+UCt0bwZmgFeaLW7pdl0LMmu+cIcc13W
 obW7FeSSaOY9SB4iAf7Ve+ScSzYWMF8duN4kugccScoAbkfdFmJJNEQxP1xNiuHS8d6P
 56yatPQ9mf503FUpI5wk/Zm+0/A5a0vjPRPkAFZ0lsY9RQ1sf+zgbGyF1av6omCDsHVr
 W7KcQwVbF5L8KjjeWRSrIfJFoXm3c86Q2cFRAt7pALaDzMzwzXYkV9ssCp77Pf3wWnWk
 N30LbOv+0uNEmKu4/t52FZKWVUXMGQWQON+MdDAMw7/htApol5FFF1Cgz35zeJBO13rF
 0Kug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXruIH/5Nj1RBFkW+z6JeIpgu9glrGiLiuNDSBzpj00I9kF1w7MgJCkE3pqcoUFV0tnTh/6mulmxUURyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxA3umwExAIK9qhr3RVh2qepzB+InOBL3/KNAJlxO1nXJE7nhYk
 HeWnPzGv89OdiAykg8zedfE8zk0sUgs6tv/pktjj9O/PxY8AmPG1
X-Google-Smtp-Source: AGHT+IFsl0LMOEc+eE6a6V7EEbrOWyNMM3oYwN8FcBYWoU6umXyuPcwsTMJnCTtKZSWtjLAMEmlNCA==
X-Received: by 2002:a05:600c:4507:b0:431:4e73:a515 with SMTP id
 5b1f17b1804b1-43184144103mr9125455e9.3.1729684068910; 
 Wed, 23 Oct 2024 04:47:48 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a48882sm8692867f8f.30.2024.10.23.04.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 04:47:48 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:47:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241023114745.kxntjsjgzzaf4lvz@skbuf>
References: <cover.1729663066.git.0x1207@gmail.com>
 <cover.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
 <49e20bbc94227cc4368dba01016df40dc711ad0a.1729663066.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/6] net: stmmac: Introduce
 separate files for FPE implementation
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

On Wed, Oct 23, 2024 at 03:05:21PM +0800, Furong Xu wrote:
> By moving FPE related code info separate files, FPE implementation
> becomes a separate module initially.
> No functional change intended.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
