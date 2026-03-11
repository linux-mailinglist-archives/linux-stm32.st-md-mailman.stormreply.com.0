Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEasFo2GsWm4DAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 16:13:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C5266282
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 16:13:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95620C8F26C;
	Wed, 11 Mar 2026 15:13:16 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0005CC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1773241960; x=1773846760; i=markus.elfring@web.de;
 bh=giiOm4nN20bJPCHKicALa9KbdO4HtuSxDT6eKFGA2mo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Wag9Fxf+yNYQPXsTRyON3wRt6746M7liQFpZpr6olBI3Hroz514SMRate1mi9Xg/
 MIASsdEYNcunoz8/0486PBcCtmiUbXpXZk7SZ9UfEjg2yZ/tPzswVOTPVBMcMOZI0
 P5tpvgiKmN/AWRSyt4QzAOeFSzOnPlGV7COlz4Px5LChMrnWVtTVF6O0hgI7HspJ9
 ZFokJK/ysEIyBkMx8vWGA+V0bsSD1FiKNQpHbXMbvGQ3/XnE4gJZFGitvxFp9Ukqq
 G2o9A+gT473BGTVzhrJiV0v2XUcnMqFfYGkufDQuk2aN8veffUebr4e9kMFhtnu0/
 59bsB5DtXuFN3mqFBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cHJ-1vWLef0wrt-00vzxd; Wed, 11
 Mar 2026 16:12:40 +0100
Message-ID: <e6145c17-64ce-494e-a41a-c847df3d999e@web.de>
Date: Wed, 11 Mar 2026 16:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Hahn <phahn-oss@avm.de>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
References: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
X-Provags-ID: V03:K1:8uNlJJTAs0E3eVrueF6w+kamgZld8V5k307BMa2qc/KwhoVrne3
 cPN5KceT1D2i5YOSNggwsPxOs655cWyte1CKlNlBLyuH93VGvstvy+ggV5GDmk4PUMu8Iwj
 lIBpLLqKBgo7uQxQM9uBZQLnvS5wa1t6ITQ23zK6Z5KinOA9Ud5Ss1etUILA/92IsKQJLWt
 MbIOhZYtTIg4ZGnA6bYYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JCtAJ/zNjOI=;sDWY82KXUVoSud92r84ZXuFAtv9
 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
 tJ2F8GMFz7+S2uTh+G9X
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 dm-devel@lists.linux.dev, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-modules@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 01/61] Coccinelle: Prefer IS_ERR_OR_NULL
 over manual NULL check
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
	DMARC_POLICY_QUARANTINE(1.50)[web.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[web.de:s=s29768273];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:cocci@inria.fr,m:Julia.Lawall@inria.fr,m:nicolas.palix@imag.fr,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.ke
 rnel.org,m:linux-gpio@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[web.de:-];
	NEURAL_HAM(-0.00)[-0.561];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wikipedia.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: E34C5266282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

4oCmCj4gKy8vIENvbmZpZGVuY2U6IEhpZ2gKClNvbWUgY29udHJpYnV0b3JzIHByZXNlbnRlZCBk
aXNjZXJuaW5nIGNvbW1lbnRzIGZvciB0aGlzIGNoYW5nZSBhcHByb2FjaC4KVGh1cyBJIGJlY2Ft
ZSBhbHNvIGN1cmlvdXMgaG93IG11Y2ggdGhleSBjYW4gZXZlbnR1YWxseSBiZSB0YWtlbiBiZXR0
ZXIgaW50byBhY2NvdW50CmJ5IHRoZSBtZWFucyBvZiB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3Vh
Z2UgKENvY2NpbmVsbGUgc29mdHdhcmUpLgoK4oCmCitAcDEgZGVwZW5kcyBvbiBwYXRjaEAKK2V4
cHJlc3Npb24gRTsKK0BACisoCj4gKy0JRSAhPSBOVUxMICYmICFJU19FUlIoRSkKPiArKwkhSVNf
RVJSX09SX05VTEwoRSkKPiArfAo+ICstCUUgPT0gTlVMTCB8fCBJU19FUlIoRSkKPiArKwlJU19F
UlJfT1JfTlVMTChFKQo+ICt8Cj4gKy0JIUlTX0VSUihFKSAmJiBFICE9IE5VTEwKPiArKwkhSVNf
RVJSX09SX05VTEwoRSkKPiArfAo+ICstCUlTX0VSUihFKSB8fCBFID09IE5VTEwKPiArKwlJU19F
UlJfT1JfTlVMTChFKQo+ICspCgpTZXZlcmFsIGRldGVjdGVkIGV4cHJlc3Npb25zIHNob3VsZCBy
ZWZlciB0byByZXR1cm4gdmFsdWVzIGZyb20gZnVuY3Rpb24gY2FsbHMuCmh0dHBzOi8vZW4ud2lr
aXBlZGlhLm9yZy93aWtpL1JldHVybl9zdGF0ZW1lbnQKCiogRG8gYW55IGRldmVsb3BtZW50IGNo
YWxsZW5nZXMgaGluZGVyIHN0aWxsIHRoZSBkZXRlcm1pbmF0aW9uIG9mIGNvcnJlc3BvbmRpbmcK
ICBmYWlsdXJlIHByZWRpY2F0ZXM/CgoqIEhvdyB3aWxsIGludGVyZXN0cyBldm9sdmUgdG8gaW1w
cm92ZSBkYXRhIHByb2Nlc3NpbmcgYW55IGZ1cnRoZXIgZm9yIHN1Y2gKICB1c2UgY2FzZXM/CgoK
UmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
