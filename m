Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xTknMypGLmoSsAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 08:11:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58434680770
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 08:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=163.com header.s=s110527 header.b=Fh2CbEYO;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=163.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B408DC5F1E9;
	Sun, 14 Jun 2026 06:04:41 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE8C5C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nz
 RaFllgbJUPkQGZbFtgLbRMeFTz9N0dOaTYnx4qasw=; b=Fh2CbEYOo7wtwc8z1l
 yTG/mKSe2YRHnusuHVOM6Kd7dOsmZBAHEL7dlqwjE+dyPvgCVA/cyfVrHvBgXfdS
 sZR/EStm8O2l+pycmnNwVldKWxLtjRZ4/vji+KAjizMVcpcVbt02vD31J3QCdLlG
 +jxMNM0exQa5Tu1T2JYzFpK4g=
Received: from PC-4CV529F122.company.local (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wBXd8_3Qy5qUeEQDg--.47324S2; 
 Sun, 14 Jun 2026 14:02:44 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: j.raczynski@samsung.com
Date: Sun, 14 Jun 2026 14:02:31 +0800
Message-Id: <20260614060231.1095292-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
References: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXd8_3Qy5qUeEQDg--.47324S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4DCry8Cw43Cw1rur4rXwb_yoW8AF43pr
 W7K3yDGwnYyr4xG3yDZr48WF1xJa9I9rW5Gw4xJrsxXw15uFnaqr4fGrWj9as7uF1vywnY
 yFWjyan7uayUJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsjj3UUUUU=
X-Originating-IP: [220.248.55.70]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QQ4ZGouRAQ5ggAA32
Cc: pabeni@redhat.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 dinghui@lixiang.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, liuxuanjun@lixiang.com,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk, kuba@kernel.org,
 maxime.chevallier@bootlin.com, dinghui1111@163.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix fatal bus error on
	resume by reinitializing RX buffers
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:j.raczynski@samsung.com,m:pabeni@redhat.com,m:xiasanbo@lixiang.com,m:yangchen11@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:liuxuanjun@lixiang.com,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:kuba@kernel.org,m:maxime.chevallier@bootlin.com,m:dinghui1111@163.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,armlinux.org.uk,kernel.org,bootlin.com,163.com,davemloft.net,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo,lixiang.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58434680770

At 2026-06-08 17:41:25, "Jakub Raczynski" <j.raczynski@samsung.com> wrote:
>On Thu, Jun 04, 2026 at 10:45:54PM +0800, Ding Hui wrote:
>> From: Ding Hui <dinghui@lixiang.com>
>> +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
>> +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf,
>> +						   queue);
>> +		if (ret) {
>> +			netdev_err(priv->dev,
>> +				   "%s: rx desc reinit failed on queue %u\n",
>> +				   __func__, queue);
>> +			mutex_unlock(&priv->lock);
>> +			rtnl_unlock();
>> +			return ret;
>> +		}
>> +	}
>
>This is not directly related to the patch, but rather stmmac_resume() itself,
>but doesn't this return and hw_setup one leave bunch of descriptor memory
>hanging and effectively leaked?
>
>> +
>>  	ret = stmmac_hw_setup(ndev);
>>  	if (ret < 0) {
>>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
>> -- 
>

You are right that both error paths leave the descriptor rings and RX
buffers allocated without an explicit cleanup. However, I prefer to call
it a memory "hanging" but not "leaked":

The memory is not permanently leaked. All RX buffers allocated in the
error path are stored in dma_conf->rx_queue[q].buf_pool[].page (or
.xdp for XSK queues), and the DMA descriptor rings themselves remain
reachable via priv->dma_conf. When the user eventually brings the
interface down, stmmac_release() -> free_dma_desc_resources() will
free everything correctly.

Maybe I should submit a follow-up patch that adds proper cleanup to
stmmac_resume()'s error paths (calling free_dma_desc_resources() and
marking the device as not running), if that would be welcome. I'd
prefer to keep it separate from this fix to keep the scope clean.

>Other than that, I don't see any obvious issues.
>

Thanks for the review.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
