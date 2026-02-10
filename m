Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEOVKbPMimndNwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 07:14:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD11174D5
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 07:14:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAC8BC3F944;
	Tue, 10 Feb 2026 06:14:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 259AFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 06:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA4F843ADF;
 Tue, 10 Feb 2026 06:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8796C116C6;
 Tue, 10 Feb 2026 06:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770704047;
 bh=NOoZ/TSgvmHM8MvVRv66uYCD2q1u3i1JerRCuxg/nYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nyF7BGSOacd8nQFeoyK69yTrIr6WEkiceyw4AmLFO/LBQGkpzoYRL1Vq5peFNPXe5
 2GRB93lvaDKY5I95NdSIEuSaoLOw+lFX62Vn/TwPEa9Foqr2ip4DHypDXObc0s47hm
 l9cluPBg1t1rZcpe3oVwhndSnk7Fq7d/VVseZG6N4sgGTylUK45zCAX5cliiSo6+jt
 Mo91W1qf9xn5E1n3sp/ZH6wUnhHCefuLoo6zDX0kFRKpBbjJCABmCXEKRONaCkbyhB
 bkeUykXpi+rRobG0QkSxwlMXFlViarS0V5Xg7DPijQAOTHtIPVfinRdmfJPm9O0Ipa
 SjUbczIUskKLg==
Date: Tue, 10 Feb 2026 11:43:59 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <aYrMp9wqk91-tQXn@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
 <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>,
 op-tee@lists.trustedfirmware.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 39FD11174D5
X-Rspamd-Action: no action

SGkgQXJuYXVkLAoKT24gVHVlLCBGZWIgMDMsIDIwMjYgYXQgMDg6NDI6MzRBTSArMDEwMCwgQXJu
YXVkIFBPVUxJUVVFTiB3cm90ZToKPiAKPiBIZWxsbyBSb2IsIFN1bWl0LAo+IAo+IEp1c3QgYSBn
ZW50bGUgcmVtaW5kZXIuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIGFkdmljZSBvciBh
IGNvbmNsdXNpb24KPiBvbiB0aGUgZGlyZWN0aW9uIHdlIHNob3VsZCB0YWtlIGZvciB0aGUgRFQg
ZGVjbGFyYXRpb24/IEkgbmVlZCB5b3VyIGlucHV0IHRvCj4gYmUgYWJsZSB0byBtb3ZlIGZvcndh
cmQuCj4gCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IEFybmF1ZAo+IAo+IE9uIDEvMTMvMjYgMTA6
MjAsIEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4gPiBIZWxsbywKPiA+IAo+ID4gT24gMS81LzI2
IDA4OjM3LCBTdW1pdCBHYXJnIHdyb3RlOgo+ID4gPiBPbiBGcmksIEphbiAwMiwgMjAyNiBhdCAw
NDoxNzoyN1BNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIERlYyAz
MCwgMjAyNSBhdCA1OjEw4oCvQU0gU3VtaXQgR2FyZwo+ID4gPiA+IDxzdW1pdC5nYXJnQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPbiBNb24sIERlYyAyOSwgMjAyNSBh
dCAwNToyNTozMFBNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiA+ID4gT24gV2Vk
LCBEZWMgMTcsIDIwMjUgYXQgMDQ6Mzk6MTJQTSArMDEwMCwgQXJuYXVkIFBvdWxpcXVlbiB3cm90
ZToKPiA+ID4gPiA+ID4gPiBBZGQgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgVEVFLWJh
c2VkIHJlbW90ZSBwcm9jZXNzb3IgY29udHJvbAo+ID4gPiA+ID4gPiA+IHNlcnZpY2UgaW1wbGVt
ZW50ZWQgYXMgYW4gT1AtVEVFIFRydXN0ZWQgQXBwbGljYXRpb24gaWRlbnRpZmllZCBieQo+ID4g
PiA+ID4gPiA+IFVVSUQgODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4Lgo+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoZSBURUUgc2VydmljZSBub2RlIGlzIGEgY2hpbGQg
b2YgdGhlCj4gPiA+ID4gPiA+ID4gImxpbmFybyxvcHRlZS10eiIgZmlybXdhcmUgbm9kZSBhbmQK
PiA+ID4gPiA+ID4gPiBhY3RzIGFzIGEgY29udGFpbmVyIGZvciByZW1vdGVwcm9jIGRldmljZXMg
dGhhdCBhcmUKPiA+ID4gPiA+ID4gPiBjb250cm9sbGVkIHZpYSBURUUuCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBJcyB0aGlzIGdlbmVyaWMgZm9yIGFueSByZW1vdGVwcm9jIGRldmljZSBvciBq
dXN0IFNUJ3MKPiA+ID4gPiA+ID4gcmVtb3RlcHJvYy4gTG9va3MKPiA+ID4gPiA+ID4gbGlrZSB0
aGUgbGF0dGVyIHRvIG1lLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGF0J3MgdHJ1ZSwgdGhlIERU
IGRlc2NyaXB0aW9uIG9mIHRoZSByZW1vdGVwcm9jIHN1Ym5vZGUgaXMgdmVyeQo+ID4gPiA+ID4g
c3BlY2lmaWMgdG8gdGhlIHZlbmRvciB3aGljaCBpbiB0aGlzIGNhc2UgaXMgU1QuCj4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSW4gYWRkaXRpb24sIHRoZSAibGluYXJvLG9w
dGVlLXR6IiBiaW5kaW5nIGlzIHVwZGF0ZWQgdG8gc3BlY2lmeSB0aGUKPiA+ID4gPiA+ID4gPiAn
I2FkZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnIHZhbHVlcyB1c2VkIGZvciBjaGlsZCBU
RUUgc2VydmljZQo+ID4gPiA+ID4gPiA+IG5vZGVzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
SSdtIHByZXR0eSBzdXJlIEkgYWxyZWFkeSByZWplY3RlZCBwZXIgc2VydmljZS9hcHAgY2hpbGQg
bm9kZXMgZm9yCj4gPiA+ID4gPiA+IE9QLVRFRSB3aGVuIGl0cyBiaW5kaW5nIHdhcyBzdWJtaXR0
ZWQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoYXQgd2FzIHRoZSByZWFzb24gdG8gaGF2ZSBkaXNj
b3ZlcmFibGUgVEVFIGJ1cyBpbiBmaXJzdCBwbGFjZSBhbmQgSQo+ID4gPiA+ID4gaGF2ZSBiZWVu
IG1vdGl2YXRpbmcgcGVvcGxlIHRvIGR5bmFtaWNhbGx5IGRpc2NvdmVyIGZpcm13YXJlIHByb3Bl
cnRpZXMKPiA+ID4gPiA+IHJhdGhlciB0aGFuIGhhcmRjb2RpbmcgaW4gdGhlIERULgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IElmIHdlIGRvIG5lZWQgc29tZXRoaW5nIGluIERUCj4gPiA+ID4gPiA+
IHRvIGRlZmluZSBzb21lIHJlc291cmNlcywgdGhlbiBjYW4ndCB3ZSBoYXZlIHNvbWUgc29ydCBv
Zgo+ID4gPiA+ID4gPiBzdGFuZGFyZC9jb21tb24gY29tbXVuaWNhdGlvbnMgY2hhbm5lbD8gSSBk
b24ndCBjYXJlIHRvCj4gPiA+ID4gPiA+IHNlZSBzb21lIHNvcnQgb2YKPiA+ID4gPiA+ID4gZnJl
ZS1mb3ItYWxsIHdoZXJlIHdlIGhhdmUgZXZlcnkgdmVuZG9yIGRvaW5nIHRoZWlyIG93biB0aGlu
Zy4gT1AtVEVFCj4gPiA+ID4gPiA+IG5lZWRzIHRvIHN0YW5kYXJpemUgdGhpcy4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gSSBzdXBwb3NlIHRoaXMgcmVxdWlyZXMgYSB3aWRlciBzY29wZSB3b3JrIGFz
IHlvdSBjYW4gc2VlCj4gPiA+ID4gPiB0aGUgRFQgcmVzb3VyY2UKPiA+ID4gPiA+IGRlcGVuZGVu
Y2UgZnJvbSBoZXJlIFsxXS4gQnkgc3RhbmRhcmRpemUgY29tbXVuaWNhdGlvbiBjaGFubmVsLCBk
byB5b3UKPiA+ID4gPiA+IG1lYW4gdG8gc2F5IGlmIGFkZGluZyBhbiBhbHRlcm5hdGl2ZSBiYWNr
ZW5kIHRvIGZ3bm9kZSBmb3IgVEVFIGluCj4gPiA+ID4gPiBwYXJhbGxlbCB0byBEVCwgQUNQSSBv
ciBzd25vZGUgaXMgdGhlIHdheSB0byBnbyBmb3IgZGlzY292ZXJpbmcgZncKPiA+ID4gPiA+IHBy
b3BlcnRpZXM/Cj4gPiA+ID4gCj4gPiA+ID4gTm8sIG5vdCBhdCBhbGwuCj4gPiA+ID4gCj4gPiA+
ID4gPiBPciBkbyB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbiBoZXJlPwo+ID4gPiA+IAo+
ID4gPiA+IFdoYXQgSSBtZWFuIGlzIHdoeSBkb2Vzbid0IHRoZSBURUUgZGVmaW5lIHRoZSBjb21t
dW5pY2F0aW9uIGNoYW5uZWwKPiA+ID4gPiAobWFpbGJveCtzaG1lbSBhbmQgbm90aWZpY2F0aW9u
IGludGVycnVwdCkgcmF0aGVyIHRoYW4gZWFjaCBURUUgYXBwPwo+ID4gPiAKPiA+ID4gVGhlIHN5
bmNocm9ub3VzIGNvbW11bmljYXRpb24gY2hhbm5lbCBpcyBhbHJlYWR5IHRoZXJlIGZvciBlYWNo
IFRFRSBhcHAKPiA+ID4gYmFzZWQgb24gKGludm9rZSBjb21tYW5kcyArIFRFRSBzaGFyZWQgbWVt
b3J5KS4gT1AtVEVFIGRvZXMgc3VwcG9ydAo+ID4gPiBub3RpZmljYXRpb24gaW50ZXJydXB0cyB0
b28gYnV0IHRob3NlIGhhdmVuJ3QgYmVlbiBleHBvc2VkIHRvIFRFRSBjbGllbnQKPiA+ID4gZHJp
dmVycyB5ZXQuIEkgc3VwcG9zZSB0aGlzIHJlbW90ZXByb2MgdXNlLWNhc2UgY2FuIGJlIGEgZ29v
ZCBleGFtcGxlIHRvCj4gPiA+IGV4cG9zZSB0aGF0IGFzIGEgZ2VuZXJpYyBURUUgbm90aWZpY2F0
aW9uIGludGVyZmFjZSB0b28uCj4gPiAKPiA+IEluIHRoZSBTVE0zMk1QIHNlcmllcywgdGhlIG1h
aWxib3hlcyBhbmQgc2hhcmVkIFJBTSBhcmUgdXNlZCBmb3IgUlBNc2cKPiA+IGNvbW11bmljYXRp
b24gYmV0d2VlbiBMaW51eCBhbmQgdGhlIHJlbW90ZSBwcm9jZXNzb3IuIE15IGNvbmNlcm4gaXMg
dGhhdAo+ID4gdXNpbmcgbm90aWZpY2F0aW9uIGluIE9QLVRFRSBjb3VsZCBpbXBhY3QgcGVyZm9y
bWFuY2UgYnkgaW50cm9kdWNpbmcKPiA+IGxhdGVuY3kuIEFkZGl0aW9uYWxseSwgdGhpcyBtaWdo
dCByZXF1aXJlIGEgRE1BIGFsbG9jYXRvciBpbiBPUC1URUUgdG8KPiA+IG1hbmFnZSB0aGUgc2hh
cmVkIG1lbW9yeS4gT25lIFJQTXNnIHZpcnRpbyByZXF1aXJlcyB0aGUgZGVjbGFyYXRpb24gb2YK
PiA+IGF0IGxlYXN0IHRocmVlIGNhcnZlb3V0cy4gTWFuYWdpbmcgdGhlc2UgYXMgbWVtb3J5IHJl
Z2lvbnMgaW4gT1AtVEVFCj4gPiB3b3VsZCBiZSBjb21wbGV4IChkdWUgdG8gbGltaXRlZCBudW1i
ZXIgb2YgbWVtb3J5IGFyZWEgZGVjbGFyYXRpb24gb24KPiA+IFNUTTMyTVAyKS4KPiA+ID4gCj4g
PiA+ID4gCj4gPiA+ID4gTW9yZSBnZW5lcmFsbHksIGlzIGhhdmluZyBURUUgYXBwcyBkZXBlbmRp
bmcgb24gcmFuZG9tIERUIHJlc291cmNlcwo+ID4gPiA+IHJlYWxseSBhIGJveCB3ZSB3YW50IHRv
IG9wZW4/IElzIHRoZSBuZXh0IHRoaW5nIGdvaW5nIHRvIGJlIGEgVEVFCj4gPiA+ID4gY2xvY2sv
cmVzZXQvZ3Bpby9wb3dlciBwcm92aWRlcj8gV2hlcmUgZG8gd2UgZHJhdyB0aGUgbGluZT8KPiA+
ID4gCj4gPiA+IFRoaXMgaXMgcmVhbGx5IGEgaGFyZCBsaW5lIHRvIGRyYXcgc2luY2Ugc2lsaWNv
bi9PRU0gdmVuZG9ycyBiYXNlZAo+ID4gPiBvbiB0aGVpcgo+ID4gPiBoYXJkd2FyZSBzZWN1cml0
eSBhcmNoaXRlY3R1cmUgcGFydGl0aW9uIHZhcmlvdXMgcmVzb3VyY2VzIGFtb25nIFRFRSBhbmQK
PiA+ID4gdGhlIExpbnV4IHdvcmxkLiBBbmQgb25lIGdlbmVyYWwgcHJpbmNpcGxlIHdlIHRyeSB0
byBmb2xsb3cgZm9yIHRoZSBURUUKPiA+ID4gaXMgdG8ga2VlcCBpdCdzIFRydXN0ZWQgQ29tcHV0
aW5nIEJhc2UgKFRDQikgdG8gYSBtaW5pbWFsIHRvby4KPiA+ID4gCj4gPiA+IElNSE8sIGlmIHRo
ZSB0aHJlYXQgbW9kZWwgaXMgd2VsbCB1bmRlcnN0b29kIHRoZW4gd2Ugc2hvdWxkIGFsbG93IGZv
cgo+ID4gPiB0aGlzIGhldHJvZ2Vub3VzIHBhcnRpdGlvbmluZyBvZiBzeXN0ZW0gcmVzb3VyY2Vz
Lgo+ID4gCj4gPiBIZXJlIGFyZSBzb21lIGFkZGl0aW9uYWwgcmVzb3VyY2VzIHdlIG5lZWQgdG8g
bWFuYWdlIHRoZSByZW1vdGUKPiA+IHByb2Nlc3Nvciwgd2hpY2ggc2VlbSBjb21wbGV4IHRvIGhh
bmRsZSB3aXRob3V0IERldmljZSBUcmVlIChEVCk6Cj4gPiAKPiA+IC0gQ2xvY2tzOiBPbiBTVE0z
Mk1QLCB3ZSBtYW5hZ2UgY2xvY2tzIHRocm91Z2ggdGhlIE9QLVRFRSBTQ01JIHNlcnZpY2UKPiA+
ICDCoCBbMV0uIFRoZSBTQ01JIE9QLVRFRSBjbG9jay9yZXNldCBzZXJ2aWNlIGFscmVhZHkgZXhp
c3RzIGFuZCBzaG91bGQgYmUKPiA+ICDCoCByZXVzZWQuCj4gPiAtIFBvd2VyIGRvbWFpbnMKPiA+
IC0gUmVtb3RlcHJvYyBXYXRjaGRvZyBpbnRlcnJ1cHQ6IENhbm5vdCBiZSBjYXVnaHQgYnkgT1At
VEVFIG9uCj4gPiAgwqAgc3RtMzJtcDE1Lgo+ID4gLSBHcmFjZWZ1bCBzaHV0ZG93biBvZiB0aGUg
cmVtb3RlIHByb2Nlc3NvcjogVGhpcyBpbnZvbHZlcyBzZW5kaW5nIGEKPiA+ICDCoCBtYWlsYm94
IG5vdGlmaWNhdGlvbiB0byByZXF1ZXN0IHNodXRkb3duIGFuZCB3YWl0aW5nIHVwIHRvIDUwMCBt
cyBmb3IKPiA+ICDCoCB0aGUgcmVtb3RlcHJvYyB0byBkZWluaXRpYWxpemUgaXRzIHJlc291cmNl
cy4gV2FpdGluZyB0aGlzIGxvbmcgaW4gdGhlCj4gPiAgwqAgc2VjdXJlIGNvbnRleHQgc2VlbXMg
aW5lZmZpY2llbnQuCj4gPiAtIGNvbXBhdGliaWxpdHkgd2l0aCBzb21lIGNvbWluZyBJUEMgbWVj
aGFuaXNtczogU3VjaCBhcyBycG1zZ19JMkMgb3IKPiA+ICDCoCB2aXJ0aW8tbXNnIG1pZ2h0IHJl
cXVpcmUgcmVtb3RlcHJvYyBzdWJub2RlIGRlc2NyaXB0aW9ucyBpbiB0aGUKPiA+ICDCoCBmdXR1
cmUuCj4gPiAKPiA+IElmIHRoZSBwcm9wb3NlZCB0b3BvbG9neSBkb2VzIG5vdCBnYWluIGNvbnNl
bnN1cywgd2hhdCBhYm91dCBhbgo+ID4gYWx0ZXJuYXRpdmUgYXBwcm9hY2ggdGhhdCBtYW5hZ2Vz
IHRoZSByZW1vdGVwcm9jIFRFRSBzaW1pbGFybHkgdG8gU0NNSSwKPiA+IGJ5IGludHJvZHVjaW5n
IGEgcmVtb3RlcHJvYy1iYWNrZW5kIHdpdGggdGhlIHByb2MgSUQgYXMgYSBwYXJhbWV0ZXI/Cj4g
PiAKPiA+IAo+ID4gJmZpcm13YXJlIHsKPiA+ICDCoMKgwqAgb3B0ZWU6IG9wdGVlIHsKPiA+ICDC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImxpbmFybyxvcHRlZS10eiI7Cj4gPiAgwqDCoMKg
wqDCoMKgwqAgbWV0aG9kID0gInNtYyI7Cj4gPiAgwqDCoMKgwqDCoMKgwqAgc3Byb2M6IHNwcm9j
IHsKPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiODBhNGMyNzUtMGE0
Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4IjsKPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gIMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+
Owo+ID4gIMKgwqDCoMKgwqDCoMKgIH07Cj4gPiAgwqDCoMKgIH07Cj4gPiB9Owo+ID4gCj4gPiBy
cHJvYzE6IG0zM0AwIHsKPiA+ICDCoCBbLi4uXQo+ID4gCj4gPiAgwqAgcmVtb3RlcHJvYy1iYWNr
ZW5kID0gPCAmc3Byb2MgMD4KPiA+IH07Cj4gPiAKPiA+IAo+ID4gcnByb2MyOiBtMEAwIHsKPiA+
ICDCoCBbLi4uXQo+ID4gCj4gPiAgwqAgcmVtb3RlcHJvYy1iYWNrZW5kID0gPCAmc3Byb2MgMT4K
PiA+IH07CgpVc2luZyBhIHBoYW5kbGUgbGlrZSB0aGlzIG1ha2VzIGl0IGEgYml0IG1vcmUgY2xl
YW5lciBidXQgSSB3b3VsZCBkZWZlcgp0byBSb2Igc2luY2UgaGUgaGFzIHRoZSBmaW5hbCBzYXkg
aGVyZS4KCi1TdW1pdAoKPiA+IAo+ID4gCj4gPiBbMV1odHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni4xOC40L3NvdXJjZS9kcml2ZXJzL2Nsay9jbGstc2NtaS5jCj4gPiAKPiA+IFRo
YW5rcywKPiA+IEFybmF1ZAo+ID4gCj4gPiA+IAo+ID4gPiAtU3VtaXQKPiA+IAo+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdAo+ID4gTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQo+ID4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
