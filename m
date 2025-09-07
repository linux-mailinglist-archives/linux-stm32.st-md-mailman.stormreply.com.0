Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7836EB47C9D
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Sep 2025 19:41:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89179C3F93F;
	Sun,  7 Sep 2025 17:41:29 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89C98C3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Sep 2025 17:41:28 +0000 (UTC)
Message-ID: <a49cff49-3fe5-417d-8f71-7ec63a68112d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1757266887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEEh8/NUEHKuAlj68cbZhgQqD/5B/8B/EJHd3Ged6PQ=;
 b=tYo5WyzaTgugqiK/oTEOefKmgSagoyoO5h5BjVK83l73Mdkfh1vxQug8voG9pEhlljd8Ki
 fbp7QHRfhLGvMgpkuh8ZyrljysAZ57sGFfsNSfpiPGkBaCI+W4U42pVgrggtjavRhkA6v8
 nPSxhFfqVDzWehQbexLABjaF3KzhGu0=
Date: Sun, 7 Sep 2025 18:41:24 +0100
MIME-Version: 1.0
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
X-Migadu-Flow: FLOW_OUT
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 05/09/2025 17:06, Sergey Shtylyov wrote:
> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
> and if stmmac_config_sub_second_increment() fails to set it to some non-0

How that can happen? Do you have real kernel oops log?


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
