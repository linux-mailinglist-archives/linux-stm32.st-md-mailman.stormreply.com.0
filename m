Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3291C95CF
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 18:01:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D448C3F95A;
	Thu,  7 May 2020 16:01:20 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB5CDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 16:01:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l25so3000033pgc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qb1yn5t1IPTyFXfHjM+vtDPWSLy9RS5I827KfmdCCPo=;
 b=Ck3JfrNRWLl4iKhvrbrwAo0aqn2iznGCOPLQN7AZB/I6QIqhcf3pbDchgXrgdxsUQZ
 r09bBzmYp0r9JmGWIo+471PZRPGKWNqRKYmQcv0AWtZQeweBK//Zkc92SQm0LU/TKDRK
 cjaTyCgRetkk61Zos0idJaFJ8Uc22QzAahcybaafa3ZFz9Vmg/rbNgBfZ1LiQ6Gc2SSH
 f+PzK5YUS6X+9FiOIykPkrxpfpEPbSqwIsYXna7y5JukxEIAe25gCn5auYl0BnYGouvU
 Iu/s7vL+POy1Yz8gtgmUB7kqFQttbdsL2otyzz41gvINlKeOaaLCgpeJP4iCsURPZZb4
 EluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qb1yn5t1IPTyFXfHjM+vtDPWSLy9RS5I827KfmdCCPo=;
 b=DH5C2SYBqDrbgenllNDvfc1SgWdinkJ4X8LD4PX8GltzJoUSlKmbZvus5EswBeen5t
 OZfpRoiJtT45l20KV4lDyBULflyyYdn4a7F27puvbEbxcvLpe/31bc38XKExIBKKbPpY
 Zv3QUNEqvxvoeNw5VsW6xRc1US08HTjGm3KcKnwjqsz6CZrKkRf2RPqaEns9xLsrtPBL
 R6r5bFIs/JXS/PfOrZgCxTLvOnBr1wdGqbIUCPQcSieBi0D81yHwXkOOTHV13X7Fi0bQ
 hkilq0MwC4eR1ECZe9kuysplXB9vbErmezi5+Bz4xQjFPfBn4ZRs9m5ez2SWe7B5DDQ7
 Gtlw==
X-Gm-Message-State: AGi0PuYjpyhnjeB00SRjNkRR2snKqDawNZhV2LuQ+Xjf1sH50sy31mm2
 DChAb3apfzyxUgkWdnzHN9A=
X-Google-Smtp-Source: APiQypIwGDuQgimi4V/sjeD/CcQ9q76z4XBPPy4eInhw8zbWKN+NgHOwT1svgrCLdMyW4GrW/Ppe3w==
X-Received: by 2002:a62:7d8c:: with SMTP id
 y134mr15435058pfc.231.1588867276268; 
 Thu, 07 May 2020 09:01:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
 by smtp.gmail.com with ESMTPSA id e11sm5321395pfl.85.2020.05.07.09.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 09:01:15 -0700 (PDT)
Date: Thu, 7 May 2020 09:01:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20200507160113.GG89269@dtor-ws>
References: <20200507151147.792578-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507151147.792578-1-hslester96@gmail.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Input: stmfts - add missed
	input_unregister_device
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

On Thu, May 07, 2020 at 11:11:47PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in probe failure and remove.
> Add the missed function calls to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
