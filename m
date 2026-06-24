Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IafmJ1rsO2q4fQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 16:40:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50D6BF36F
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 16:40:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCC16C57B41;
	Wed, 24 Jun 2026 14:40:25 +0000 (UTC)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC4F3C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 14:40:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.196.245.140])
 by APP-05 (Coremail) with SMTP id zQCowAA3j9JQ7Dtq2XIHFQ--.947S2;
 Wed, 24 Jun 2026 22:40:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 24 Jun 2026 22:40:15 +0800
Message-ID: <20260624144015.63929-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3j9JQ7Dtq2XIHFQ--.947S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFW8XFWfCr15ZF4kWF4Durg_yoW8ZrWxpF
 4akaykGw4Ig34Syr4jq3WjqF1YgF93ta9rCrWkX3yI9wn09Fy3GryrKFy5Za9xKFn5A3WU
 ZFsrtFW5CF4Y9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
 6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgXocUUU
 UU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Cc: linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: cec: stm32: return an error when
	log-address wait times out
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A50D6BF36F

c3RtMzJfY2VjX2FkYXBfbG9nX2FkZHIoKSB3YWl0cyBmb3IgVFhTT00gdG8gY2xlYXIgYmVmb3Jl
IGRpc2FibGluZyBDRUMKYW5kIHVwZGF0aW5nIHRoZSBsb2dpY2FsIGFkZHJlc3MgcmVnaXN0ZXJz
LiBUaGUgd2FpdCByZXN1bHQgaXMgaWdub3JlZCwKc28gYSB0aW1lb3V0IGNhbiBzdGlsbCBiZSBy
ZXBvcnRlZCBhcyBhIHN1Y2Nlc3NmdWwgbG9naWNhbCBhZGRyZXNzCnVwZGF0ZS4KClJldHVybiB0
aGUgcG9sbGluZyBlcnJvciBiZWZvcmUgdG91Y2hpbmcgdGhlIGFkZHJlc3MgcmVnaXN0ZXJzLiBD
b21wdXRlCnRoZSBhZGRyZXNzIG1hc2sgb25seSBmb3IgdmFsaWQgbG9naWNhbCBhZGRyZXNzZXMg
c28gdGhlIGludmFsaWQtYWRkcmVzcwpwYXRoIGRvZXMgbm90IGV2YWx1YXRlIGEgc2hpZnQgYmFz
ZWQgb24gQ0VDX0xPR19BRERSX0lOVkFMSUQuCgpTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3Ug
PHBlbmdwZW5nQGlzY2FzLmFjLmNuPgotLS0KIGRyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL3N0
bTMyL3N0bTMyLWNlYy5jIHwgMTQgKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
Y2VjL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jIGIvZHJpdmVycy9tZWRpYS9jZWMvcGxhdGZv
cm0vc3RtMzIvc3RtMzItY2VjLmMKaW5kZXggMWVjMGNlY2UwLi44MjcwOWI1ZWMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jCisrKyBiL2Ry
aXZlcnMvbWVkaWEvY2VjL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jCkBAIC0xOTMsMTggKzE5
MywyNCBAQCBzdGF0aWMgaW50IHN0bTMyX2NlY19hZGFwX2VuYWJsZShzdHJ1Y3QgY2VjX2FkYXB0
ZXIgKmFkYXAsIGJvb2wgZW5hYmxlKQogc3RhdGljIGludCBzdG0zMl9jZWNfYWRhcF9sb2dfYWRk
cihzdHJ1Y3QgY2VjX2FkYXB0ZXIgKmFkYXAsIHU4IGxvZ2ljYWxfYWRkcikKIHsKIAlzdHJ1Y3Qg
c3RtMzJfY2VjICpjZWMgPSBhZGFwLT5wcml2OwotCXUzMiBvYXIgPSAoMSA8PCBsb2dpY2FsX2Fk
ZHIpIDw8IDE2OwogCXUzMiB2YWw7CisJaW50IHJldDsKIAogCS8qIFBvbGwgZXZlcnkgMTAwwrVz
IHRoZSByZWdpc3RlciBDRUNfQ1IgdG8gd2FpdCBlbmQgb2YgdHJhbnNtaXNzaW9uICovCi0JcmVn
bWFwX3JlYWRfcG9sbF90aW1lb3V0KGNlYy0+cmVnbWFwLCBDRUNfQ1IsIHZhbCwgISh2YWwgJiBU
WFNPTSksCi0JCQkJIDEwMCwgQ0VDX1hGRVJfVElNRU9VVF9NUyAqIDEwMDApOworCXJldCA9IHJl
Z21hcF9yZWFkX3BvbGxfdGltZW91dChjZWMtPnJlZ21hcCwgQ0VDX0NSLCB2YWwsICEodmFsICYg
VFhTT00pLAorCQkJCSAgICAgICAxMDAsIENFQ19YRkVSX1RJTUVPVVRfTVMgKiAxMDAwKTsKKwlp
ZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJcmVnbWFwX3VwZGF0ZV9iaXRzKGNlYy0+cmVnbWFw
LCBDRUNfQ1IsIENFQ0VOLCAwKTsKIAotCWlmIChsb2dpY2FsX2FkZHIgPT0gQ0VDX0xPR19BRERS
X0lOVkFMSUQpCi0JCXJlZ21hcF91cGRhdGVfYml0cyhjZWMtPnJlZ21hcCwgQ0VDX0NGR1IsIE9B
UiwgMCk7Ci0JZWxzZQorCWlmIChsb2dpY2FsX2FkZHIgPT0gQ0VDX0xPR19BRERSX0lOVkFMSUQp
IHsKKwkJcmVnbWFwX3VwZGF0ZV9iaXRzKGNlYy0+cmVnbWFwLCBDRUNfQ0ZHUiwgT0FSLCAwKTsK
Kwl9IGVsc2UgeworCQl1MzIgb2FyID0gQklUKGxvZ2ljYWxfYWRkcikgPDwgMTY7CisKIAkJcmVn
bWFwX3VwZGF0ZV9iaXRzKGNlYy0+cmVnbWFwLCBDRUNfQ0ZHUiwgb2FyLCBvYXIpOworCX0KIAog
CXJlZ21hcF91cGRhdGVfYml0cyhjZWMtPnJlZ21hcCwgQ0VDX0NSLCBDRUNFTiwgQ0VDRU4pOwog
Ci0tIAoyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
