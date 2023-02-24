Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EABE66A3B9B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 08:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D273C6A5E7;
	Mon, 27 Feb 2023 07:17:23 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.237])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3671C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 06:43:18 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 383881A00AA3;
 Thu, 23 Feb 2023 14:43:57 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1hmD38rH2CL; Thu, 23 Feb 2023 14:43:56 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 4E8CE1A0088E;
 Thu, 23 Feb 2023 14:43:56 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: herbert@gondor.apana.org.au
Date: Sat, 25 Feb 2023 07:14:29 +0800
Message-Id: <20230224231430.2948-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:17:23 +0000
Cc: linus.walleij@linaro.org, kunyu@nfschina.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm32: stm32-hash: Add kmalloc_array
	allocation check
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


hello senior:
  'rctx->hw_context' is a member of the rctx pointer array object and will pass 'memcpy(out, rctx, sizeof(*rctx)) at the end of the function;  ', copied to the out pointer memory, it cannot be released, I think this patch does an allocation check on the 'rctx->hw_context' pointer should help a bit.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
