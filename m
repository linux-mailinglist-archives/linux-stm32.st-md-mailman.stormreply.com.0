Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCr+DmEZsWllqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D37C25DD36
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3706C900AD;
	Wed, 11 Mar 2026 07:27:28 +0000 (UTC)
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1454C8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 11:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143726; bh=6EuXq65aclW87MvbjKpAiGhSvzG4CQReYSdgtvzfvbQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OlBoHHpVof4NyozqV3vxjKcjvk/y17oYz+NX0GgTt5nMsrjzgfoQZCcD5nyMeqLWk
 htiyUI/wWJswuTU+8y83flTCS0RnzHoiIrK06LfnovJyy/ccZ/NhBYSEivcOaZTGCa
 Ux8J7cHyncVvErf5jzV1qMqauD0EUnF5+GejdCq4=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ae-e21d-7f0000032729-7f000001da2a-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:26 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de
 [IPv6:2001:bf0:244:244::71]) by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:26 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:03 +0100
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-37-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4819; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=6EuXq65aclW87MvbjKpAiGhSvzG4CQReYSdgtvzfvbQ=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZT+7AKzVVh94OZwGC1ojred94HRoubB3Jj7
 iZaELcQHomJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGUwAKCRA0LQZT0ays
 26wAB/9TBiS4XQT7vnGKfXiPWlqEeJl/SwNfE8gRd+LVLd2GPoXI77JKlqZA5KJHsuEaYytwRHj
 0co7/mL9JXJHOUE/UPYXt3qFrwRsleM7nnJK7ysqo/nuMkL1zXCK+fpnqQpoBiKUkPJFjSSQWWs
 A0qg0NaHPa2ThCoMkZDNEnWBS7X/+ME4OgDoWVp7r1X953fdXqxWSX8/++3IUoA8zLfZZvBTN8Z
 lQp574N8BAAfdqG0oi1OBRhOByM9d1hpEYg4qXmJvNDZzHG8su81gcwwO+KaBKEy6Skfpo/fDOj
 n85UVFKj8iDz3Ls4+zhkzod+J74YBwXEvBpocAWj1P06D/Zf
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143726-88610E6F-62997727/0/0
X-purgate-type: clean
X-purgate-size: 4821
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
Cc: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Andy Yan <andy.yan@rock-chips.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [Linux-stm32] [PATCH 37/61] drm: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
X-Rspamd-Queue-Id: 1D37C25DD36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:heiko@sntech.de,m:joonas.lahtinen@linux.intel.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:zhi.wang.linux@gmail.com,m:simona@ffwll.ch,m:rfoss@kernel.org,m:jernej.skrabec@gmail.com,m:tursulin@ursulin.net,m:jonas@kwiboo.se,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vi
 vi@intel.com,m:neil.armstrong@linaro.org,m:zhenyuw.linux@gmail.com,m:hjc@rock-chips.com,m:tzimmermann@suse.de,m:alexander.deucher@amd.com,m:andy.yan@rock-chips.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sntech.de,linux.intel.com,ideasonboard.com,intel.com,gmail.com,ffwll.ch,kernel.org,ursulin.net,kwiboo.se,linaro.org,rock-chips.com,suse.de,amd.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[76];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

UHJlZmVyIHVzaW5nIElTX0VSUl9PUl9OVUxMKCkgb3ZlciB1c2luZyBJU19FUlIoKSBhbmQgYSBt
YW51YWwgTlVMTApjaGVjay4KCkNoYW5nZSBnZW5lcmF0ZWQgd2l0aCBjb2NjaW5lbGxlLgoKVG86
IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPgpUbzogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClRvOiBSb2JlcnQgRm9zcyA8cmZvc3NAa2Vy
bmVsLm9yZz4KVG86IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KVG86IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KVG86IEplcm5laiBT
a3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+ClRvOiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpUbzogTWF4aW1lIFJpcGFyZCA8bXJp
cGFyZEBrZXJuZWwub3JnPgpUbzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+ClRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpUbzogU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPgpUbzogWmhlbnl1IFdhbmcgPHpoZW55dXcubGludXhAZ21haWwu
Y29tPgpUbzogWmhpIFdhbmcgPHpoaS53YW5nLmxpbnV4QGdtYWlsLmNvbT4KVG86IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+ClRvOiBKb29uYXMgTGFodGluZW4gPGpv
b25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+ClRvOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+ClRvOiBUdnJ0a28gVXJzdWxpbiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+
ClRvOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClRvOiAiQ2hyaXN0
aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KVG86IFNhbmR5IEh1YW5nIDxo
amNAcm9jay1jaGlwcy5jb20+ClRvOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+
ClRvOiBBbmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+CkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51
eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgSGFo
biA8cGhhaG4tb3NzQGF2bS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYyAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxl
ci5jICAgICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Rl
c3QuYyAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGkt
ZHNpLXJvY2tjaGlwLmMgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9w
c3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
CmluZGV4IGVlODhjMGU3OTNiMDQxNmQyMDEwNWE0MzQ0OGNiNDAzNzQwMmU2NGIuLjY0ZmEyYmM4
ZDI4MTk3MTQ3ZWUyMmI0Zjc0MTM0Y2MyN2RkOWIzMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0zNjA4LDcgKzM2MDgsNyBAQCB2b2lkIGR3X2hkbWlf
cmVtb3ZlKHN0cnVjdCBkd19oZG1pICpoZG1pKQogewogCWRybV9icmlkZ2VfcmVtb3ZlKCZoZG1p
LT5icmlkZ2UpOwogCi0JaWYgKGhkbWktPmF1ZGlvICYmICFJU19FUlIoaGRtaS0+YXVkaW8pKQor
CWlmICghSVNfRVJSX09SX05VTEwoaGRtaS0+YXVkaW8pKQogCQlwbGF0Zm9ybV9kZXZpY2VfdW5y
ZWdpc3RlcihoZG1pLT5hdWRpbyk7CiAJaWYgKCFJU19FUlIoaGRtaS0+Y2VjKSkKIAkJcGxhdGZv
cm1fZGV2aWNlX3VucmVnaXN0ZXIoaGRtaS0+Y2VjKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwppbmRleCBlZjRl
OTIzYTg3Mjg0MzMzOTc0M2QyMWU0ODc3MjI1ODU1ZGE5MjFlLi42NzQ4YWNiNDE2M2U4ZjU2NThj
OTIwMWEwNDEyYjM4ODYyYzdiYWFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5
c2ZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jCkBAIC02MDAsNyArNjAwLDcg
QEAgc3RydWN0IGRldmljZSAqZHJtX3N5c2ZzX21pbm9yX2FsbG9jKHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yKQogICovCiBpbnQgZHJtX2NsYXNzX2RldmljZV9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiB7Ci0JaWYgKCFkcm1fY2xhc3MgfHwgSVNfRVJSKGRybV9jbGFzcykpCisJaWYgKElT
X0VSUl9PUl9OVUxMKGRybV9jbGFzcykpCiAJCXJldHVybiAtRU5PRU5UOwogCiAJZGV2LT5jbGFz
cyA9IGRybV9jbGFzczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hl
ZHVsZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwppbmRleCAxNWZk
ZDUxNGNhODM2ZTg0ZjRkZTk1ZTMyMDdhYjQ1YmI5MjQzNDI2Li45MzNlYzVmZmExZjFlYmFmZDY4
Nzk5NmYxNjdiOTgyNDkwNzAyMjExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5j
CkBAIC02NzUsMTAgKzY3NSwxMCBAQCBzdGF0aWMgdm9pZCByZWxlYXNlX3NoYWRvd19iYXRjaF9i
dWZmZXIoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShiYiwgcG9zLCAmd29ya2xvYWQtPnNoYWRvd19iYiwgbGlzdCkgewogCQlp
ZiAoYmItPm9iaikgewogCQkJaTkxNV9nZW1fb2JqZWN0X2xvY2soYmItPm9iaiwgTlVMTCk7Ci0J
CQlpZiAoYmItPnZhICYmICFJU19FUlIoYmItPnZhKSkKKwkJCWlmICghSVNfRVJSX09SX05VTEwo
YmItPnZhKSkKIAkJCQlpOTE1X2dlbV9vYmplY3RfdW5waW5fbWFwKGJiLT5vYmopOwogCi0JCQlp
ZiAoYmItPnZtYSAmJiAhSVNfRVJSKGJiLT52bWEpKQorCQkJaWYgKCFJU19FUlJfT1JfTlVMTChi
Yi0+dm1hKSkKIAkJCQlpOTE1X3ZtYV91bnBpbihiYi0+dm1hKTsKIAogCQkJaTkxNV9nZW1fb2Jq
ZWN0X3VubG9jayhiYi0+b2JqKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3Rlc3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3Rlc3QuYwppbmRl
eCAwYjQ1OWY3ZGYyM2JhZTNlZWY3ZTM2ZjRiNWYzNTYzOGZiNmY0OTg1Li41NzMyODRjNGFmNjBm
MTJkN2VkZWM4ODkyNjBmYzhhMmUyYjcwNDIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90ZXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dGVzdC5jCkBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX2RvX3Rlc3RfbW92
ZXMoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIGludCBmbGFnKQogCQkJcmFkZW9uX2JvX3Vu
cmVzZXJ2ZShndHRfb2JqW2ldKTsKIAkJCXJhZGVvbl9ib191bnJlZigmZ3R0X29ialtpXSk7CiAJ
CX0KLQkJaWYgKGZlbmNlICYmICFJU19FUlIoZmVuY2UpKQorCQlpZiAoIUlTX0VSUl9PUl9OVUxM
KGZlbmNlKSkKIAkJCXJhZGVvbl9mZW5jZV91bnJlZigmZmVuY2UpOwogCQlicmVhazsKIAl9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCmluZGV4
IDM1NDdkOTFiMjVkMzE3YzZjYWQ2OTBkYTdkOTdhN2U1NDM2YzAyMzYuLjhhMjY3ZGU4NWRhOWM3
NmMyZTI5YjJhYmFiZjEyMThlNDAwMjgyYzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCkBAIC0xMDk1LDcgKzEwOTUsNyBAQCBzdGF0aWMg
aW50IGR3X21pcGlfZHNpX3JvY2tjaGlwX2hvc3RfZGV0YWNoKHZvaWQgKnByaXZfZGF0YSwKIAlz
dHJ1Y3QgZGV2aWNlICpzZWNvbmQ7CiAKIAlzZWNvbmQgPSBkd19taXBpX2RzaV9yb2NrY2hpcF9m
aW5kX3NlY29uZChkc2kpOwotCWlmIChzZWNvbmQgJiYgIUlTX0VSUihzZWNvbmQpKQorCWlmICgh
SVNfRVJSX09SX05VTEwoc2Vjb25kKSkKIAkJY29tcG9uZW50X2RlbChzZWNvbmQsICZkd19taXBp
X2RzaV9yb2NrY2hpcF9vcHMpOwogCiAJY29tcG9uZW50X2RlbChkc2ktPmRldiwgJmR3X21pcGlf
ZHNpX3JvY2tjaGlwX29wcyk7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
