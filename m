Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C96683F5
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 09:14:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A0E1C9BEDC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 07:14:29 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 046EFC930E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2019 15:21:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=17; SR=0; TI=SMTPD_---0TWrpoRa_1563117663; 
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWrpoRa_1563117663) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 14 Jul 2019 23:21:03 +0800
To: Jonathan Corbet <corbet@lwn.net>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
 <20190712113427.62fa7ffc@lwn.net>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <36c522c5-975e-e38e-daad-0f3d9f93b186@linux.alibaba.com>
Date: Sun, 14 Jul 2019 23:21:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712113427.62fa7ffc@lwn.net>
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:14:23 +0000
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] Documentation: move architectures
	together
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgSm9uLAoKVGhhbmtzIGZvciBxdWljayByZXNwb25zZSEKCtTaIDIwMTkvNy8xMyDJz87nMToz
NCwgSm9uYXRoYW4gQ29yYmV0INC0tcA6Cj4gT24gRnJpLCAxMiBKdWwgMjAxOSAxMDoyMDowNyAr
MDgwMAo+IEFsZXggU2hpIDxhbGV4LnNoaUBsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+
IFRoZXJlIGFyZSBtYW55IGRpZmZlcmVudCBhcmNocyBpbiBEb2N1bWVudGF0aW9uLyBkaXIsIGl0
J3MgYmV0dGVyIHRvCj4+IG1vdmUgdGhlbSB0b2dldGhlciBpbiAnRG9jdW1lbnRhdGlvbi9hcmNo
JyB3aGljaCBmb2xsb3dzIGZyb20ga2VybmVsIHNvdXJjZS4KPiAKPiBTbyB0aGlzIHNlZW1zIGNl
cnRhaW4gdG8gY29sbGlkZSBiYWRseSB3aXRoIE1hdXJvJ3MgUlNULWNvbnZlcnNpb24gbW9uc3Rl
cgo+IHBhdGNoIHNldC4KCkkgZG9uJ3QgbWVhbiB0aGF0LCBzb3JyeSwgYW5kIHdlIGNhbiBmaWd1
cmUgb3V0IGlmIGJvdGggb2YgdGhlbSBhcmUgd29ydGh5IHRvIGJlIHBpY2tlZCB1cC4KCj4gCj4g
TW9yZSB0byB0aGUgcG9pbnQsIHRob3VnaC4uLmlmIHdlIGFyZSBnb2luZyB0byB0aHJhc2ggdXAg
dGhpbmdzIHRoaXMKPiBiYWRseSwgd2Ugd2FudCB0byBiZSBzdXJlIHRoYXQgd2UncmUgZG9pbmcg
aXQgcmlnaHQgc28gd2UgZG9uJ3QgZW5kIHVwCj4gcmVuYW1pbmcgZXZlcnl0aGluZyBhZ2Fpbi4g
IEdyb3VwaW5nIHN0dWZmIGludG8gYSBuZXcgYXJjaC8gc3ViZGlyZWN0b3J5Cj4gYWRkcyBhIGJp
dCBvZiBvcmRlciwgYnV0IGl0IGRvZXNuJ3QgZG8gbXVjaCB0b3dhcmQgdHJ5aW5nIHRvIG9yZ2Fu
aXplIG91cgo+IGRvY3VtZW50YXRpb24gZm9yIGl0cyByZWFkZXJzLCBhbmQgaXQgZG9lc24ndCBo
ZWxwIHVzIHRvIG1vZGVybml6ZSB0aGUKPiBkb2NzIGFuZCBnZXQgcmlkIG9mIHRoZSBvbGQsIHVz
ZWxlc3Mgc3R1ZmYuICBBIHF1aWNrIGNoZWNrIHNob3dzIHRoYXQgbWFueQo+IG9mIHRoZXNlIGZp
bGVzIGhhdmUgc2VlbiBubyBjaGFuZ2VzIG90aGVyIHRoYW4gdHlwbyBmaXhlcyBzaW5jZSB0aGUK
PiBiZWdpbm5pbmcgb2YgdGhlIEdpdCBlcmEuCgpSaWdodCwgdGhlcmUgaXMgc29tZSBkb2NzIHdo
aWNoIG5lZWQgdG8gYmUgdXBkYXRlIG9yIGV2ZW4gZHJvcCwgYW5kIGEgcmVvcmRlciB3b3VsZCBi
ZSBhIHRpbWluZyB0byBwdXNoIGVhY2ggb2YgYXJjaCBtYWludGFpbmVyIHRvIGRvIHNvbWV0aGlu
ZywgaXNuJ3QgaXQ/IEFueXdheSwgcmVvcmRlcmluZyAgZG9jdW1lbnRzIGxpa2Uga2VybmVsIHNv
dXJjZSBkaXIgY291bGQgYmUgb25lIG9mIGNob2ljZXMuIDopCgo+IAo+IFNvLCBpbiBteSBtaW5k
LCB0aGlzIG5lZWRzIHNvbWUgdGhvdWdodC4gIE1heWJlIHdlIHdhbnQgYQo+IERvY3VtZW50YXRp
b24vYXJjaCBpbiB0aGUgZW5kLCBidXQgSSdtIG5vdCBjb252aW5jZWQgdGhhdCB3ZSBzaG91bGQg
anVzdAo+IGNyZWF0ZSBpdCBhbmQgZmlsbCBpdCB3aXRoIGEgc25vdyBzaG92ZWwuICBUaGlzIG1p
Z2h0IGJlIGEgZ29vZCB0aGluZyB0bwo+IGRpc2N1c3MgYXQgdGhlIGtlcm5lbCBzdW1taXQgaW4g
U2VwdGVtYmVyLgoKVGhhbmtzIGZvciBjb25zaWRlcmluZywgYW55d2F5LCBpdCBjb3VsZCBiZSBh
IGdvb2Qgc3RhcnQgdG8gZ2V0IGhhbmRzIGRpcnR5IHdoZXRoZXIgdGhlIGFyY2ggZGlyIGlzIG5l
ZWRlZC4gCgpUaGFua3MKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
