Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6755BD57
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 04:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 262A0C04003;
	Tue, 28 Jun 2022 02:21:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88364C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 02:21:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11460617BC;
 Tue, 28 Jun 2022 02:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3298C341CB;
 Tue, 28 Jun 2022 02:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382894;
 bh=pqPD6qoEi8JT199in7jg5DAol4iF8DjKFPgIGYlvQoc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyqsByaDXQg5yOq6smuSw5cw5zuxTHl+rHrYo/OlHMZ1OuAvd9ONI8/jqrzLdImbD
 VTWK7UP5itlkHBzyKuMpIHQb6qIkgBzcX3Jxv+GaaOi42Ij7zVfd0aNVRCj/2kEQLZ
 O6R0SdzzjedD8BThjNur1AhOSXcjIOf8wUfiJdziqd597shekW5NqBhdePKYvvXsYS
 oJiSFkiCFnaZl7loW+605mJuFv8NTwWJO3O6z94S5MRsftmK5FPbSEThNMZ5b+uoVL
 ifMihZ1oD6Ug5EuhwczB9HuCayJu7LpnnMklqlMLvNn/Nf3BKVwwKkKVP3/5TDDlCW
 d3gJG/ZMvv/2g==
Date: Tue, 28 Jun 2022 04:21:29 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20220628022129.GA8452@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
 <20220628005825.GA161566@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628005825.GA161566@embeddedor>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMDI6NTg6MjVBTSArMDIwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBPbiBNb24sIEp1biAyNywgMjAyMiBhdCAwOTo0MDo1MlBNIC0wMzAwLCBK
YXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAyNywgMjAyMiBhdCAwODoyNzoz
N1BNICswMjAwLCBEYW5pZWwgQm9ya21hbm4gd3JvdGU6Cj4gPiA+IE9uIDYvMjcvMjIgODowNCBQ
TSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+ID4gPiBUaGVyZSBpcyBhIHJlZ3VsYXIg
bmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+ID4gPiA+IGhh
dmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0
cnVjdHVyZS4KPiA+ID4gPiBLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJs
ZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+ID4gPiA+IGNhc2VzLiBUaGUgb2xkZXIg
c3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZAo+ID4gPiA+
IG5vIGxvbmdlciBiZSB1c2VkWzJdLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgY29kZSB3YXMgdHJh
bnNmb3JtZWQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlOgo+ID4gPiA+IChsaW51eC01LjE5
LXJjMiQgc3BhdGNoIC0tam9icyAkKGdldGNvbmYgX05QUk9DRVNTT1JTX09OTE4pIC0tc3AtZmls
ZSBzY3JpcHQuY29jY2kgLS1pbmNsdWRlLWhlYWRlcnMgLS1kaXIgLiA+IG91dHB1dC5wYXRjaCkK
PiA+ID4gPiAKPiA+ID4gPiBAQAo+ID4gPiA+IGlkZW50aWZpZXIgUywgbWVtYmVyLCBhcnJheTsK
PiA+ID4gPiB0eXBlIFQxLCBUMjsKPiA+ID4gPiBAQAo+ID4gPiA+IAo+ID4gPiA+IHN0cnVjdCBT
IHsKPiA+ID4gPiAgICAuLi4KPiA+ID4gPiAgICBUMSBtZW1iZXI7Cj4gPiA+ID4gICAgVDIgYXJy
YXlbCj4gPiA+ID4gLSAwCj4gPiA+ID4gICAgXTsKPiA+ID4gPiB9Owo+ID4gPiA+IAo+ID4gPiA+
IC1mc3RyaWN0LWZsZXgtYXJyYXlzPTMgaXMgY29taW5nIGFuZCB3ZSBuZWVkIHRvIGxhbmQgdGhl
c2UgY2hhbmdlcwo+ID4gPiA+IHRvIHByZXZlbnQgaXNzdWVzIGxpa2UgdGhlc2UgaW4gdGhlIHNo
b3J0IGZ1dHVyZToKPiA+ID4gPiAKPiA+ID4gPiAuLi9mcy9taW5peC9kaXIuYzozMzc6Mzogd2Fy
bmluZzogJ3N0cmNweScgd2lsbCBhbHdheXMgb3ZlcmZsb3c7IGRlc3RpbmF0aW9uIGJ1ZmZlciBo
YXMgc2l6ZSAwLAo+ID4gPiA+IGJ1dCB0aGUgc291cmNlIHN0cmluZyBoYXMgbGVuZ3RoIDIgKGlu
Y2x1ZGluZyBOVUwgYnl0ZSkgWy1XZm9ydGlmeS1zb3VyY2VdCj4gPiA+ID4gCQlzdHJjcHkoZGUz
LT5uYW1lLCAiLiIpOwo+ID4gPiA+IAkJXgo+ID4gPiA+IAo+ID4gPiA+IFNpbmNlIHRoZXNlIGFy
ZSBhbGwgWzBdIHRvIFtdIGNoYW5nZXMsIHRoZSByaXNrIHRvIFVBUEkgaXMgbmVhcmx5IHplcm8u
IElmCj4gPiA+ID4gdGhpcyBicmVha3MgYW55dGhpbmcsIHdlIGNhbiB1c2UgYSB1bmlvbiB3aXRo
IGEgbmV3IG1lbWJlciBuYW1lLgo+ID4gPiA+IAo+ID4gPiA+IFsxXSBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1iZXIKPiA+ID4gPiBbMl0gaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4xNi9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJv
LWxlbmd0aC1hbmQtb25lLWVsZW1lbnQtYXJyYXlzCj4gPiA+ID4gCj4gPiA+ID4gTGluazogaHR0
cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzc4Cj4gPiA+ID4gQnVpbGQtdGVzdGVk
LWJ5OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzYyYjY3NWVjLndLWDZBT1o2Y2JFNzF2
dEYlMjVsa3BAaW50ZWwuY29tLwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4g
U2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiBIaSBhbGwh
Cj4gPiA+ID4gCj4gPiA+ID4gSkZZSTogSSdtIGFkZGluZyB0aGlzIHRvIG15IC1uZXh0IHRyZWUu
IDopCj4gPiA+IAo+ID4gPiBGeWksIHRoaXMgYnJlYWtzIEJQRiBDSToKPiA+ID4gCj4gPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWwtcGF0Y2hlcy9icGYvcnVucy83MDc4NzE5MzcyP2NoZWNr
X3N1aXRlX2ZvY3VzPXRydWUKPiA+ID4gCj4gPiA+ICAgWy4uLl0KPiA+ID4gICBwcm9ncy9tYXBf
cHRyX2tlcm4uYzozMTQ6MjY6IGVycm9yOiBmaWVsZCAndHJpZV9rZXknIHdpdGggdmFyaWFibGUg
c2l6ZWQgdHlwZSAnc3RydWN0IGJwZl9scG1fdHJpZV9rZXknIG5vdCBhdCB0aGUgZW5kIG9mIGEg
c3RydWN0IG9yIGNsYXNzIGlzIGEgR05VIGV4dGVuc2lvbiBbLVdlcnJvciwtV2dudS12YXJpYWJs
ZS1zaXplZC10eXBlLW5vdC1hdC1lbmRdCj4gPiA+ICAgICAgICAgICBzdHJ1Y3QgYnBmX2xwbV90
cmllX2tleSB0cmllX2tleTsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KPiA+IAo+ID4gVGhpcyB3aWxsIGJyZWFrIHRoZSByZG1hLWNvcmUgdXNlcnNwYWNlIGFzIHdl
bGwsIHdpdGggYSBzaW1pbGFyCj4gPiBlcnJvcjoKPiA+IAo+ID4gL3Vzci9iaW4vY2xhbmctMTMg
LURWRVJCU19ERUJVRyAtRGlidmVyYnNfRVhQT1JUUyAtSWluY2x1ZGUgLUkvdXNyL2luY2x1ZGUv
bGlibmwzIC1JL3Vzci9pbmNsdWRlL2RybSAtZyAtTzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9fX3cv
MS9zPS4gLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNl
Y3VyaXR5IC1XZGF0ZS10aW1lIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdtaXNzaW5nLXByb3RvdHlw
ZXMgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdmb3JtYXQ9MiAtV2Nh
c3QtZnVuY3Rpb24tdHlwZSAtV2Zvcm1hdC1ub25saXRlcmFsIC1XZGF0ZS10aW1lIC1XbmVzdGVk
LWV4dGVybnMgLVdzaGFkb3cgLVdzdHJpY3QtcHJvdG90eXBlcyAtV29sZC1zdHlsZS1kZWZpbml0
aW9uIC1XZXJyb3IgLVdyZWR1bmRhbnQtZGVjbHMgLWcgLWZQSUMgICAtc3RkPWdudTExIC1NRCAt
TVQgbGliaWJ2ZXJicy9DTWFrZUZpbGVzL2lidmVyYnMuZGlyL2NtZF9mbG93LmMubyAtTUYgbGli
aWJ2ZXJicy9DTWFrZUZpbGVzL2lidmVyYnMuZGlyL2NtZF9mbG93LmMuby5kIC1vIGxpYmlidmVy
YnMvQ01ha2VGaWxlcy9pYnZlcmJzLmRpci9jbWRfZmxvdy5jLm8gICAtYyAuLi9saWJpYnZlcmJz
L2NtZF9mbG93LmMKPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9saWJpYnZlcmJzL2NtZF9m
bG93LmM6MzM6Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9pbmZpbmliYW5kL2Nt
ZF93cml0ZS5oOjM2Ogo+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvaW5maW5pYmFu
ZC9jbWRfaW9jdGwuaDo0MToKPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2luZmlu
aWJhbmQvdmVyYnMuaDo0ODoKPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2luZmlu
aWJhbmQvdmVyYnNfYXBpLmg6NjY6Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9p
bmZpbmliYW5kL2liX3VzZXJfaW9jdGxfdmVyYnMuaDozODoKPiA+IGluY2x1ZGUvcmRtYS9pYl91
c2VyX3ZlcmJzLmg6NDM2OjM0OiBlcnJvcjogZmllbGQgJ2Jhc2UnIHdpdGggdmFyaWFibGUgc2l6
ZWQgdHlwZSAnc3RydWN0IGliX3V2ZXJic19jcmVhdGVfY3FfcmVzcCcgbm90IGF0IHRoZSBlbmQg
b2YgYSBzdHJ1Y3Qgb3IgY2xhc3MgaXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZh
cmlhYmxlLXNpemVkLXR5cGUtbm90LWF0LWVuZF0KPiA+ICAgICAgICAgc3RydWN0IGliX3V2ZXJi
c19jcmVhdGVfY3FfcmVzcCBiYXNlOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KPiA+IGluY2x1ZGUvcmRtYS9pYl91c2VyX3ZlcmJzLmg6NjQ0OjM0OiBlcnJv
cjogZmllbGQgJ2Jhc2UnIHdpdGggdmFyaWFibGUgc2l6ZWQgdHlwZSAnc3RydWN0IGliX3V2ZXJi
c19jcmVhdGVfcXBfcmVzcCcgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1Y3Qgb3IgY2xhc3MgaXMg
YSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90LWF0
LWVuZF0KPiA+ICAgICAgICAgc3RydWN0IGliX3V2ZXJic19jcmVhdGVfcXBfcmVzcCBiYXNlOwo+
ID4gCj4gPiBXaGljaCBpcyB3aHkgSSBnYXZlIHVwIHRyeWluZyB0byBjaGFuZ2UgdGhlc2UuLgo+
ID4gCj4gPiBUaG91Z2ggbWF5YmUgd2UgY291bGQganVzdCBzd2l0Y2ggb2ZmIC1XZ251LXZhcmlh
YmxlLXNpemVkLXR5cGUtbm90LWF0LWVuZCAgZHVyaW5nIGNvbmZpZ3VyYXRpb24gPwo+IAo+IE5v
LiBJIHRoaW5rIG5vdyB3ZSBjYW4gZWFzaWx5IHdvcmthcm91bmQgdGhlc2Ugc29ydHMgb2YgcHJv
YmxlbXMgd2l0aAo+IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4gCXN0cnVjdCBmbGV4IHsKPiAJ
CWFueV90eXBlIGFueV9tZW1iZXI7Cj4gCQl1bmlvbiB7Cj4gCQkJdHlwZSBhcnJheVswXTsKPiAJ
CQlfX0RFQ0xBUkVfRkxFWF9BUlJBWSh0eXBlLCBhcnJheV9mbGV4KTsKPiAJCX07Cj4gCX07CgpN
bW1oLi4uIG5vcGU7IHRoaXMgZG9lc24ndCB3b3JrWzFdLgoKV2UgbmVlZCB0byB0aGluayBpbiBh
IGRpZmZlcmVudCBzdHJhdGVneS4KCi0tCkd1c3Rhdm8KClsxXSBodHRwczovL2dvZGJvbHQub3Jn
L3ovYXY3OVBxYmZ6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
