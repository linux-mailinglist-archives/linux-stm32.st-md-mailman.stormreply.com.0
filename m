Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEzZKmUPymmS4wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A6355BA7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 07:51:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A593C0693D;
	Mon, 30 Mar 2026 05:51:32 +0000 (UTC)
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com
 [203.205.221.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1323AC8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1774705444; bh=rFLCYdDTvsSc8eyn9nD3Tqfl6DUP1pTYa4FCzNUr3pk=;
 h=From:To:Cc:Subject:Date;
 b=KOMCcVlLrSMQeaHojSqK/zeAnVGbtcJlrLcB+MIJE7r4kLuWoYA3Uio9bd7lLw1PD
 ZSRpJapMBdfvWl6d+RLqyAbqbF63QTA/+ZfB4wZpguMkkBiiHJlBlyHVH9cFCsDS7C
 i4M3Lv0WVleKTatcpwmGoxHUA4ZAi5bRPmh7xbgI=
Received: from mail.red54.com ([103.253.24.18])
 by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
 id AEC8E62D; Sat, 28 Mar 2026 21:43:44 +0800
X-QQ-mid: xmsmtpt1774705424t775usdsw
Message-ID: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahgv7/OMCpr9OjGJVJ35WpFVBu5hY3UbIKjaD8n0VNPx0ORi4DKu
 xxvo2ulNpGH1tHptD/O0r4fn/N3oU+DBXq5Wvrksv8aJhedYI73PyPknhlyBoV4dkxU2r83r7NgI
 NzwrZaQUBAv0z+0eZHNJpA1h98SMzsHksMuIhCNX+247Vu03Y6WYaaWg4KT4LQMkYan6BDNpOWPQ
 3Q1EFiAJ8/xgssRkADtBVYhWiFJgMWDI5UcX08lZdUV7J0fltBxXlgX1O1FfSE3yu4vutBdiz8in
 0/2assn8KjpWDrDI8szZiOrrhqXTV6Onvo4Ed/hJKWbAJjkiunnyj+XianaHH5GpuJjtKwRG21qa
 fvKrrpFp/tuz993awFMvuSycJMs08dv5P0bqhAuC9oqCMSSECytdbpIAguHoY33CM7/p96qL+fdA
 QSySXUGJETn+osENjS6n6i4rFd49XETgr/fDDmXES9/ZeS5wEHThWysFZVr1R0vXu1nLo4eS5zqV
 uhSdn+8+EU17y4F9m1TsRe6I16vlRL3ZEbBmdaFT51n/myvF/rZU1tiP4FdGNCqyIAFSrMZYxhcb
 5toweIp9YUzq5vL1aTc9KDVR/kAg+2as78wu9tq78FcBdbvTD3jvLT/wYPooz7bgjNPmEYzXbxPG
 KsD5BfY5fcUZvgoiW7TS2zuFHkdCiVAFkLjevFe8hcj5UzBEOx6K9vAZ6Pf9JHOpKWaAqZUc+vUZ
 aB7bWPbtnxcBGwWG0pNIv4p169Iy3LzBtwEsdPVk7Q6UUU/V4hM3ma7nzkB5+G5ziifQFteY8gCf
 DNfmWwccx5xbt9L7epqJN2vRpADeHUGoAByEKcZoMIq5FotygvnsmQ0HWDrtHcOca+oX6D8x1zzE
 jc1JhA9nzlIeGj+ErnSbK8NRYtOAWPZ3e6eJFlD02uyAbZPjb3Z2HLTIkrG54v4bvN5C+MOx9kWK
 DMAVGvbGKMW37w+w3ZcKjYZ7mwrFOLrjm5R3uC3dWn2d0EawK+UXZJXC36iw9Z7yboR7YuPC5xP8
 T0yvBw0DByvqqwUxMLpi2J03/iQR3kiDjE5fjiPxaLXLcAj2/q
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?=
 <Yeking@Red54.com>
To: linux-rockchip@lists.infradead.org
Date: Sat, 28 Mar 2026 13:43:31 +0000
X-OQ-MSGID: <20260328134331.26627-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2026 05:51:31 +0000
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?=
 <Yeking@Red54.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[40];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qq.com:s=s201512];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[red54.com : SPF not aligned (strict),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[Yeking@Red54.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:heiko@sntech.de,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:Yeking@Red54.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[Yeking@Red54.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sntech.de,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,Red54.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[qq.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.974];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 079A6355BA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Q29ycmVjdCB0aGUgdHlwbyAicmszNTIwIiB0byAicmszNTI4IiBpbiBjb21tZW50LgoKU2lnbmVk
LW9mZi1ieTog6LCi6Ie06YKmIChYSUUgWmhpYmFuZykgPFlla2luZ0BSZWQ1NC5jb20+Ci0tLQog
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCmluZGV4IGIwNDQxYTM2OGNi
MS4uOGQ3MDQyZTY4OTI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1yay5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLXJrLmMKQEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgaW50IHJrX2NvbmZpZ3Vy
ZV9pb19jbGtzZWwoc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYpCiAJY3J1ID0gIWlvOwog
CiAJLyogVGhlIGlvX2Nsa3NlbCBjb25maWd1cmF0aW9uIGNhbiBiZSBlaXRoZXI6Ci0JICogIDA9
Q1JVLCAxPUlPIChyazM1MDYsIHJrMzUyMCwgcmszNTc2KSBvcgorCSAqICAwPUNSVSwgMT1JTyAo
cmszNTA2LCByazM1MjgsIHJrMzU3Nikgb3IKIAkgKiAgMD1JTywgMT1DUlUgKHJrMzU4OCkKIAkg
KiB3aGVyZSBDUlUgbWVhbnMgdGhlIHRyYW5zbWl0IGNsb2NrIGNvbWVzIGZyb20gdGhlIENSVSBh
bmQgSU8KIAkgKiBtZWFucyB0aGUgdHJhbnNtaXQgY2xvY2sgY29tZXMgZnJvbSBJTy4KLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
