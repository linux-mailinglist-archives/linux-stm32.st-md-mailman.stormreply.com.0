Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7E770D0B
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 03:30:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DAA3C6B469;
	Sat,  5 Aug 2023 01:30:08 +0000 (UTC)
Received: from 10.mo582.mail-out.ovh.net (10.mo582.mail-out.ovh.net
 [87.98.157.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8665EC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 01:30:06 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.156.62])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 2B572256DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 01:30:06 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pnhxz (unknown [10.110.171.120])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5B5731FE49;
 Sat,  5 Aug 2023 01:30:05 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
 by ghost-submission-6684bf9d7b-pnhxz with ESMTPSA
 id Ix4hDR2mzWQPPwAAYnACEA
 (envelope-from <andi@etezian.org>); Sat, 05 Aug 2023 01:30:05 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002dd6b534a-6dc9-46b8-bb69-b53ea92a6e10,
 05ACED94171614EC843435E2D99940E8A2AB1814) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 178.238.172.51
From: Andi Shyti <andi.shyti@kernel.org>
To: pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Ruan Jinjie <ruanjinjie@huawei.com>
Date: Sat,  5 Aug 2023 03:29:12 +0200
Message-Id: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731112755.1943630-1-ruanjinjie@huawei.com>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11970004863637654087
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrkeehgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepveevieffieefgfefuddvteelffeuhfelffejteejuddvveekveehvdejgeefteevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrvdefkedrudejvddrhedupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
	handle for platform_get_irq()
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

Hi

On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> 

With the commit log fixed, applied to i2c/andi-for-next on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/1] i2c: stm32: fix the return value handle for platform_get_irq()
      commit: 603b3cf89d8a96cc0e51eb15853f28944eb78f31
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
