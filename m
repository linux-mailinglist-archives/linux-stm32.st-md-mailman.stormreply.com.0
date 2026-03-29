Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGj4C4N0yWmxyAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:50:43 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4509353AAD
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:50:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FD20C8F269;
	Sun, 29 Mar 2026 18:50:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A441C8F260
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 18:50:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A2C941B20;
 Sun, 29 Mar 2026 18:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD7AC2BCB1;
 Sun, 29 Mar 2026 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774810239;
 bh=O82FpE/7ZgUmCxQeK0am6BAdKnT2A6ZdwoNVv3WFz5w=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FaRTxRSG1VuymtP02WGPHzUkmXvzxs2ZnPhrpHxCDzor/J0ZcNxBiOQTGAmm6Dbdj
 IojhvHCiJMHRNo0yWJtMkS7fhNE/bo5AbTpRhjvq24fIElUnik4SHYeO9MpG7nOuZP
 tNvWXfSol5idU2kOwo3qymDS3DVHkl5rl0GvhU1vT2XOk47maa9uhTTFbP/laHLfgh
 Au9F3RDZVp4xzUjopO2WRirIEsUFzUgj1vFcul8FzE/bQ+wLbojC+SWhIkArHhcysz
 /Bi7Ei6gj7lB+kIlZWdXAQRv8TD6+BUY+QxBRek0mF68LYoY2PeQqMEV2wZO0bgMVD
 5V76/1hQhNHPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02DD13930012; Sun, 29 Mar 2026 18:50:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177481022378.437043.15447396546007070348.git-patchwork-notify@kernel.org>
Date: Sun, 29 Mar 2026 18:50:23 +0000
References: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
In-Reply-To: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
To: =?utf-8?b?6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0ByZWQ1NC5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-kernel@vger.kernel.org, heiko@sntech.de, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, edumazet@google.com,
 mcoquelin.stm32@gmail.com, Yeking@Red54.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:=?utf-8?b?6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0ByZWQ1NC5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:linux-kernel@vger.kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:Yeking@Red54.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:=?utf-8?b?6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0ByZWQ1NC5jb20@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sntech.de,lunn.ch,st-md-mailman.stormreply.com,lists.infradead.org,google.com,gmail.com,Red54.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net];
	NEURAL_SPAM(0.00)[0.745];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,?=,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[red54.com:email]
X-Rspamd-Queue-Id: B4509353AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKG1h
aW4pCmJ5IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OgoKT24gU2F0LCAyOCBNYXIg
MjAyNiAxMzo0MzozMSArMDAwMCB5b3Ugd3JvdGU6Cj4gQ29ycmVjdCB0aGUgdHlwbyAicmszNTIw
IiB0byAicmszNTI4IiBpbiBjb21tZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IOiwouiHtOmCpiAo
WElFIFpoaWJhbmcpIDxZZWtpbmdAUmVkNTQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKICAtIG5ldDogc3RtbWFjOiBkd21hYy1yazogRml4IHR5cG8gaW4gY29tbWVudAogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy8zMGZjZjI4ZDgzZWUKCllv
dSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAKRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4K
aHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
