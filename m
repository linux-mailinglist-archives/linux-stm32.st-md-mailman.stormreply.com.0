Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9EE8B1D5C
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 11:04:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 108C9C7128B;
	Thu, 25 Apr 2024 09:04:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05A56C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:04:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F0251007;
 Thu, 25 Apr 2024 02:05:19 -0700 (PDT)
Received: from [10.57.86.198] (unknown [10.57.86.198])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8332F3F64C;
 Thu, 25 Apr 2024 02:04:49 -0700 (PDT)
Message-ID: <c174be43-7a35-44fa-854f-0fd69968e08b@arm.com>
Date: Thu, 25 Apr 2024 10:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 James Clark <james.clark@arm.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 0/5] coresight: Convert to platform remove
 callback returning void
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgVXdlCgpPbiAyMy8wNC8yMDI0IDA5OjA2LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBI
ZWxsbywKPiAKPiB0aGlzIHNlcmllcyBjb252ZXJ0cyBhIGZldyBwbGF0Zm9ybSBkcml2ZXJzIGJl
bG93IGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodAo+IHRoYXQgcmVjZW50bHkgc3RhcnRlZCB0
byBpbXBsZW1lbnQgYSAucmVtb3ZlKCkgY2FsbGJhY2sgdG8gaW1wbGVtZW50Cj4gLnJlbW92ZV9u
ZXcoKSBpbnN0ZWFkLiBTZWUgY29tbWl0IDVjNWE3NjgwZTY3YiAoInBsYXRmb3JtOiBQcm92aWRl
IGEgcmVtb3ZlCj4gY2FsbGJhY2sgdGhhdCByZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVu
ZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwKPiBnb2FsLgo+IAo+IEFsbCBjb252ZXJz
YXRpb25zIGFyZSB0cml2aWFsLCBiZWNhdXNlIHRoZSBkcml2ZXIncyAucmVtb3ZlKCkgY2FsbGJh
Y2tzCj4gcmV0dXJuZWQgemVybyB1bmNvbmRpdGlvbmFsbHkgYWxyZWFkeS4KPiAKPiBUaGVyZSBh
cmUgbm8gaW50ZXJkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGUgZml2ZSBwYXRjaGVzLCBzbyB0aGV5
IGNvdWxkIGJlIHBpY2tlZAo+IHVwIGluZGl2aWR1YWxseSBpZiBuZWVkIGJlLiBBZnRlciB0aGUg
bWVyZ2Ugd2luZG93IGxlYWRpbmcgdG8gdjYuMTAtcmMxCj4gKGFzc3VtaW5nIExpbnVzIGhhcyA+
PSAxMCBmaW5nZXJzIHRoaXMgY3ljbGUgOi0pIEkgd2FudCB0byBzd2l0Y2ggdGhlIHByb3RvdHlw
ZQo+IG9mIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSB0byByZXR1cm4gdm9pZC4gU28g
cGxlYXNlIGVpdGhlciBtZXJnZSB0aGlzCj4gc2VyaWVzIHRvZ2V0aGVyIHdpdGggdGhlIGNvbW1p
dHMgaW50cm9kdWNpbmcgLnJlbW92ZSgpIHRoYXQgY3VycmVudGx5IHNpdCBpbgo+IHRoZSBuZXh0
IGJyYW5jaCBvZgo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9jb3Jlc2lnaHQvbGludXguZ2l0LCBvciBhY2NlcHQgbWUKPiBzZW5kaW5nIHRoZW0gdG9nZXRo
ZXIgd2l0aCB0aGUgcGF0Y2ggY2hhbmdpbmcgdGhlIGZ1bmN0aW9uJ3MgcHJvdG90eXBlIGZvcgo+
IGluY2x1c2lvbiB0byBHcmVnJ3MgZHJpdmVyLWNvcmUgdHJlZS4KClRoYW5rcyBmb3IgY2F0Y2hp
bmcgdGhlc2UuIEkgd2lsbCBhcHBseSB0aGVtIHRvIGNvcmVzaWdodCBuZXh0IGJyYW5jaC4KCgo+
IAo+IEhhdmluZyBzYWlkIHRoYXQsIHRoZSBwYXRjaGVzIGFkZGluZyBwbGF0Zm9ybSBkcml2ZXIg
c3VwcG9ydCBmb3IgdGhlc2UgY291bGQgYmUKPiBpbXByb3ZlZDoKPiAKPiAgIC0gZGV2X2dldF9k
cnZkYXRhKCkgbmV2ZXIgcmV0dXJucyBOVUxMIGluIHRoZXNlIC5yZW1vdmUoKSBmdW5jdGlvbnMg
YmVjYXVzZQo+ICAgICAucHJvYmUoKSBjYWxsZWQgZGV2X3NldF9kcnZkYXRhKCkuIEZvciB0aGUg
dXNhZ2Ugb2YgV0FSTl9PTiBhbHNvIHNlZQo+ICAgICBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMv
OTY5OTIzLy4gKFRoYXQgbGluaydzIGNvbnRlbnQgaXMgYmVoaW5kIGEgcGF5d2FsbAo+ICAgICB1
bnRpbCBNYXkgMiwgdGhlIFRMRFIgaXM6IERvbid0IHVzZSBXQVJOX09OKCkuKSBTbyB0aGUgcmVz
cGVjdGl2ZSBjaGVja3MKPiAgICAgd2l0aCB0aGUgZWFybHkgcmV0dXJuIGNvdWxkIGJldHRlciBi
ZSBkcm9wcGVkIElNSE8uCj4gCj4gICAtIElTX0VSUl9PUl9OVUxMKGRydmRhdGEtPnBjbGspIGlz
IG5ldmVyIHRydWUgaW4gLnJlbW92ZSgpLiBBbHNvIG5vdGUgdGhhdAo+ICAgICBJU19FUlJfT1Jf
TlVMTCBpcyB1Z2x5IGFuZCBnaXZlcyBoYXJkbHkgZXZlciB0aGUgcmlnaHQgY29uZGl0aW9uIHRv
IGNoZWNrCj4gICAgIGZvci4gTm90ZSBmdXJ0aGVyIHRoYXQgY2xrID09IE5VTEwgaXNuJ3QgdXN1
YWxseSBhIHByb2JsZW0sIE5VTEwgaXMgdXNlZCBhcwo+ICAgICBkdW1teSBjbGsgcmV0dXJuZWQg
YnkgY2xrX2dldF9vcHRpb25hbCgpIGFuZCBhbGwgY2xvY2sgQVBJIGZ1bmN0aW9ucyBoYW5kbGUK
PiAgICAgdGhhdCBqdXN0IGZpbmUuIFNvIGlmIGF0IGFsbCwgYmV0dGVyIGNoZWNrIG9ubHkgZm9y
IElTX0VSUihkcnZkYXRhLT5wY2xrKS4KClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb25zLCBJIHdp
bGwgbGV0IEFuc2h1bWFuIGFkZHJlc3MgdGhlbS4KCktpbmQgcmVnYXJkcwpTdXp1a2kKCgo+IAo+
IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+IFV3ZSBLbGVpbmUtS8O2bmlnICg1KToKPiAgICBjb3Jl
c2lnaHQ6IGNhdHU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCj4gICAgY29yZXNpZ2h0OiBkZWJ1ZzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgICBjb3Jlc2lnaHQ6IHN0bTogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAgICBjb3Jlc2lnaHQ6IHRt
YzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKPiAg
ICBjb3Jlc2lnaHQ6IHRwaXU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCj4gCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0
LWNhdHUuYyAgICAgIHwgNyArKystLS0tCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LWNwdS1kZWJ1Zy5jIHwgNyArKystLS0tCj4gICBkcml2ZXJzL2h3dHJhY2luZy9j
b3Jlc2lnaHQvY29yZXNpZ2h0LXN0bS5jICAgICAgIHwgNyArKystLS0tCj4gICBkcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy1jb3JlLmMgIHwgNyArKystLS0tCj4gICBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRwaXUuYyAgICAgIHwgNyArKyst
LS0tCj4gICA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQo+IAo+IGJhc2UtY29tbWl0OiBhNTk2NjhhOTM5N2U3MjQ1YjI2ZTliZTg1ZDIzZjI0MmZmNzU3
YWU4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
