Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TwuzDidHLmrOsAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 08:16:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE4680779
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jun 2026 08:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=163.com header.s=s110527 header.b="XamlYa/H";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=163.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 797A4C5F1E9;
	Sun, 14 Jun 2026 06:16:06 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6029C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jun 2026 06:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=h6
 UuS0kzMForj/4DigAMdegzm+Yyq511CmAEpPSByMk=; b=XamlYa/HwgBstmOZK+
 d1Hyo0tpNXiNK+tBdxY7FPQWH/JqqGszS4T+01JymI4QshyEdbbvsNps1JB1RvtS
 DL/ugjCmxWgSj6yBbqfCJMyP1j1ZjvnWEUdFik02toMWQ9yaAjfciucdKKSt7vX9
 TPZZjW2i6bsopIpwrQz6eOkLw=
Received: from PC-4CV529F122.company.local (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wCHwGq9Ri5q3ywFDQ--.46614S2; 
 Sun, 14 Jun 2026 14:14:36 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: kuba@kernel.org
Date: Sun, 14 Jun 2026 14:14:20 +0800
Message-Id: <20260614061420.1156099-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608193059.78e05dce@kernel.org>
References: <20260608193059.78e05dce@kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wCHwGq9Ri5q3ywFDQ--.46614S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4kGw1fXF4xur43AF43KFg_yoWxZFgE9r
 sFgwn7XrWDtFy5JF90kr43uFWq9F47Jr90q3WUJF90kF97Gas3ZF9xCr9IvF1kWrn2vFnF
 krnFgFyxGry7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRC380DUUUUU==
X-Originating-IP: [220.248.55.70]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QzqF2ouRsxldgAA39
Cc: j.raczynski@samsung.com, pabeni@redhat.com, xiasanbo@lixiang.com,
 yangchen11@lixiang.com, dinghui@lixiang.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, liuxuanjun@lixiang.com,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk,
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[samsung.com,redhat.com,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,armlinux.org.uk,bootlin.com,163.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:j.raczynski@samsung.com,m:pabeni@redhat.com,m:xiasanbo@lixiang.com,m:yangchen11@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:liuxuanjun@lixiang.com,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:dinghui1111@163.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[163.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3DE4680779

At 2026-06-09 10:30:59, "Jakub Kicinski" <kuba@kernel.org> wrote:
>On Thu,  4 Jun 2026 22:45:54 +0800 Ding Hui wrote:
>> +/**
>> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
>> + *				   after stmmac_clear_descriptors()
>> + * @priv: driver private structure
>> + * @dma_conf: structure holding the dma data
>> + * @queue: RX queue index
>
>nit:
>
>kernel-doc script says:
>
>Warning: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1733 No description found for return value of 'stmmac_reinit_rx_descriptors'
>
>You need a Returns: statement in this kdoc
>-- 
>pw-bot: cr

Sorry for late reply. I will update a new version for it. Thanks.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
