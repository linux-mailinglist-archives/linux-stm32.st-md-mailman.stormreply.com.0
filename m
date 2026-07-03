Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t6I0LLVbR2q0WwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Jul 2026 08:50:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1556FF367
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Jul 2026 08:50:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBE1C8F286;
	Fri,  3 Jul 2026 06:50:28 +0000 (UTC)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA3FC0F02D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2026 06:50:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.196.245.140])
 by APP-01 (Coremail) with SMTP id qwCowACXM8yqW0dqqpWABA--.2367S2;
 Fri, 03 Jul 2026 14:50:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>
Date: Fri,  3 Jul 2026 14:50:16 +0800
Message-ID: <20260703065016.97181-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701214250.GD2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
 <20260701214250.GD2108533@google.com>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXM8yqW0dqqpWABA--.2367S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyrCF17ur1kCF1rXr47Jwb_yoWDuFc_Wr
 n0vF9Fkw1xtwnrtrs5ta1SgrZrX3yUZr1UJrW8JwsFq34rWrsxuryDArnxCa48CanFgrs8
 GanFy3ya9398ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
 6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Cc: linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: depopulate child
	devices on populate failure
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,iscas.ac.cn,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E1556FF367

Hi Lee,

Thanks for taking a look.

I checked devm_of_platform_populate(), but I don't think it covers this
particular failure path on its own.

devm_of_platform_populate() only installs the devres cleanup after
of_platform_populate() has returned success.  If of_platform_populate()
returns an error after creating some earlier children, the helper just
frees its devres record and those partial children are not depopulated.

For stm32-timers, I think we still need the explicit ordering used by
remove: depopulate children before stm32_timers_dma_remove().  The child
drivers get the parent drvdata, and the PWM child can call the parent
stm32_timers_dma_burst_read() helper, so releasing the parent DMA
channels while partially-created children remain would keep the same
ordering problem the remove path avoids.

I agree the inline unwind is not the clearest form.  I can send a v2
using a normal goto unwind label and a short comment explaining the
partial-populate case, unless you prefer a different shape.

Thanks,
Pengpeng

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
