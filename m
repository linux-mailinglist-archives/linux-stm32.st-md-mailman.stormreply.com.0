Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IQGJOJ3Cmo61wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 04:22:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B9656505D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 04:22:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7058CC87EDD;
	Mon, 18 May 2026 02:22:25 +0000 (UTC)
Received: from mail.eswincomputing.com (mail.eswincomputing.com
 [123.124.195.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AD4BC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 02:22:22 +0000 (UTC)
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
 by app1 (Coremail) with SMTP id TAJkCgB3DHHFdwpqSU4aAA--.34605S2;
 Mon, 18 May 2026 10:21:58 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 18 May 2026 10:21:52 +0800
Message-ID: <20260518022156.484-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260518021919.404-1-lizhi2@eswincomputing.com>
References: <20260518021919.404-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgB3DHHFdwpqSU4aAA--.34605S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1UWry3tFy5XrWDtF1UWrg_yoW8KFy8pr
 W5CFy5Kw4UJr1xGwn7A3Wvqa45tayUJF47uryrtFs3Zay3tF90qay0ka4DG3WjqrWxZa1f
 Z3yUAF47uanFk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4U
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRByxiUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
Cc: pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com,
 linmin@eswincomputing.com, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, Zhi Li <lizhi2@eswincomputing.com>
Subject: [Linux-stm32] [PATCH net v2 4/5] net: stmmac: eswin: correct RGMII
	delay granularity to 20 ps
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
X-Rspamd-Queue-Id: 36B9656505D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:lizhi2@eswincomputing.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.913];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,eswincomputing.com:email,eswincomputing.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

RnJvbTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgoKVGhlIEVJQzc3MDAgTUFD
IGltcGxlbWVudHMgcHJvZ3JhbW1hYmxlIFJHTUlJIGRlbGF5IGFkanVzdG1lbnQgd2l0aCBhCmdy
YW51bGFyaXR5IG9mIDIwIHBzIHBlciBoYXJkd2FyZSBzdGVwLgoKVGhlIGRyaXZlciBwcmV2aW91
c2x5IGNvbnZlcnRlZCByeC1pbnRlcm5hbC1kZWxheS1wcyBhbmQKdHgtaW50ZXJuYWwtZGVsYXkt
cHMgdmFsdWVzIHVzaW5nIGEgMTAwIHBzIHN0ZXAgc2l6ZSwgcmVzdWx0aW5nIGluCmluY29ycmVj
dCBkZWxheSBwcm9ncmFtbWluZy4KClVwZGF0ZSB0aGUgY29udmVyc2lvbiB0byB1c2UgdGhlIGNv
cnJlY3QgMjAgcHMgZ3JhbnVsYXJpdHkgc28gdGhlCnByb2dyYW1tZWQgZGVsYXkgbWF0Y2hlcyB0
aGUgdmFsdWVzIGRlc2NyaWJlZCBpbiB0aGUgZGV2aWNlIHRyZWUuCgpGaXhlczogZWE3N2RiYmRi
YzRlICgibmV0OiBzdG1tYWM6IGFkZCBFc3dpbiBFSUM3NzAwIGdsdWUgZHJpdmVyIikKU2lnbmVk
LW9mZi1ieTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgotLS0KIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWVpYzc3MDAuYyB8IDggKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5j
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5jCmlu
ZGV4IDU0MWIyNzlmMDhhMS4uZWY2MGNhYjI0NTMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1laWM3NzAwLmMKKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWljNzcwMC5jCkBAIC0yOCw4ICsyOCw4IEBA
CiAKIC8qCiAgKiBUWC9SWCBDbG9jayBEZWxheSBCaXQgTWFza3M6Ci0gKiAtIFRYIERlbGF5OiBi
aXRzIFsxNDo4XSDigJQgVFhfQ0xLIGRlbGF5ICh1bml0OiAwLjFucyBwZXIgYml0KQotICogLSBS
WCBEZWxheTogYml0cyBbMzA6MjRdIOKAlCBSWF9DTEsgZGVsYXkgKHVuaXQ6IDAuMW5zIHBlciBi
aXQpCisgKiAtIFRYIERlbGF5OiBiaXRzIFsxNDo4XSDigJQgVFhfQ0xLIGRlbGF5ICh1bml0OiAw
LjAybnMgcGVyIGJpdCkKKyAqIC0gUlggRGVsYXk6IGJpdHMgWzMwOjI0XSDigJQgUlhfQ0xLIGRl
bGF5ICh1bml0OiAwLjAybnMgcGVyIGJpdCkKICAqLwogI2RlZmluZSBFSUM3NzAwX0VUSF9UWF9B
REpfREVMQVkJR0VOTUFTSygxNCwgOCkKICNkZWZpbmUgRUlDNzcwMF9FVEhfUlhfQURKX0RFTEFZ
CUdFTk1BU0soMzAsIDI0KQpAQCAtMTQ4LDcgKzE0OCw3IEBAIHN0YXRpYyBpbnQgZWljNzcwMF9k
d21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCS8qIFJlYWQgcngtaW50
ZXJuYWwtZGVsYXktcHMgYW5kIHVwZGF0ZSByeF9jbGsgZGVsYXkgKi8KIAlpZiAoIW9mX3Byb3Bl
cnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLAogCQkJCSAgInJ4LWludGVybmFsLWRlbGF5
LXBzIiwgJmRlbGF5X3BzKSkgewotCQl1MzIgdmFsID0gbWluKGRlbGF5X3BzIC8gMTAwLCBFSUM3
NzAwX01BWF9ERUxBWV9VTklUKTsKKwkJdTMyIHZhbCA9IG1pbihkZWxheV9wcyAvIDIwLCBFSUM3
NzAwX01BWF9ERUxBWV9VTklUKTsKIAogCQlkd2NfcHJpdi0+ZXRoX2Nsa19kbHlfcGFyYW0gJj0g
fkVJQzc3MDBfRVRIX1JYX0FESl9ERUxBWTsKIAkJZHdjX3ByaXYtPmV0aF9jbGtfZGx5X3BhcmFt
IHw9CkBAIC0xNjEsNyArMTYxLDcgQEAgc3RhdGljIGludCBlaWM3NzAwX2R3bWFjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogUmVhZCB0eC1pbnRlcm5hbC1kZWxheS1w
cyBhbmQgdXBkYXRlIHR4X2NsayBkZWxheSAqLwogCWlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIo
cGRldi0+ZGV2Lm9mX25vZGUsCiAJCQkJICAidHgtaW50ZXJuYWwtZGVsYXktcHMiLCAmZGVsYXlf
cHMpKSB7Ci0JCXUzMiB2YWwgPSBtaW4oZGVsYXlfcHMgLyAxMDAsIEVJQzc3MDBfTUFYX0RFTEFZ
X1VOSVQpOworCQl1MzIgdmFsID0gbWluKGRlbGF5X3BzIC8gMjAsIEVJQzc3MDBfTUFYX0RFTEFZ
X1VOSVQpOwogCiAJCWR3Y19wcml2LT5ldGhfY2xrX2RseV9wYXJhbSAmPSB+RUlDNzcwMF9FVEhf
VFhfQURKX0RFTEFZOwogCQlkd2NfcHJpdi0+ZXRoX2Nsa19kbHlfcGFyYW0gfD0KLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
