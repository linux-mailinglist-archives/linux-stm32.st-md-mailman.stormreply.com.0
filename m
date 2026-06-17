Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RJtKDlJlMmq6zQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 11:13:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E45697CD4
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 11:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="j5HG/IQd";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5565EC8F26F;
	Wed, 17 Jun 2026 09:13:53 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5575C6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 09:13:51 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7fedf0e99bbso2910117b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 02:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781687630; cv=none;
 d=google.com; s=arc-20240605;
 b=YagbVCeM4DGGa/SUuadxwbpfRUeBHZsxos72l2vkdX0d0bo8S1cRz24gCXqgmC3ncg
 Aq6dk4vb5UtkyrzJ222Xy4P6ySNZ9bKbD9AxDdvgPeOBAyku87+O5wqquP95QJSVwoe6
 A9pI94x1373iBfGTZHRSiPpJYz5rpkou8Hbo7padfeydoL5JOvj8TBPNNbCtL6nTumXe
 xKU2fo+6SygOSwM014fncPZrQNqeZ7JgN6n1QBFVl1T09vjwE2GCHXd4qVv2J/Rt5Kcd
 sCm+iqa5xejuNgMI1aNyWKfF1WWCpd6pe3VQSwaDh4gbJJYjzE2AlK5kABZiX33f9pMZ
 235Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
 fh=YLpr6kzpVqvSmMNYijI6Jjz25nzOh1BDOBXxhXOT7gQ=;
 b=DEiF2xwMDT2NrMrsxjcwyd3VCqUXCTmXx+hsDASPNQ88UZ3vTKfPjMmQlqnePihghb
 9L9XHuvkSFBewC5NRgrGCJ0xBqOjdn4ZgSoYtLXHq7X8r/hxQigUasi30mz0s2CNigi5
 H9plBS34Au9BusIECGP4L4Ym+U3KcYyL5gnpkZMdx5OQLOSr0jmM/6ZScz6Ct3rs0wpN
 qSRaYWUw9I3xN8y+tNvYLni+hJeNSeVobBwwt8Hz9APvTgj20XrNmJ0FfiP5hZEEIG0H
 yJSWAEjTdmwJuiICRpbuHIYK9itkKpYeyRHjLIEJ441uo388jhIn0Ho5vMOoQF5v5AGO
 hqFw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781687630; x=1782292430;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
 b=j5HG/IQdvIB+kEDq6FiI2L0PM2qVJOlJ9e11bSlu+OUKAWrZHpliK++s42Av757/PX
 +yoailHHr1w3gt9g2sqwwZlK5ob7XPsjCaCk2wBZREAEaHakN7OIN0sM5JFszbSALmxp
 l7EP9ClRaOEG4UbEEN9d2FTni/WhVA7RszpSfV7c+sgnX3QCFrg4B4vPi8fkl8ZO0Koi
 OrKAsezt1PKIjr4c4KYyDp1Begp/mDJDfYrHhkFz6lBSnTVe6VlCbIx34YsU+qiNolgk
 X0/cFz496FjBuWi9oUfPtT2KbaP5RzW0TW5A5whf/iuuI/8+BsF2saPZ04XrDsHeZEWJ
 VGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781687630; x=1782292430;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3ois7uJYLekKAQG+JspaUzPJU4OIUiESd+WUf3xjbcM=;
 b=BCyO99hRQbTYEV5kvIiU9iFVqvKt2GyGJFJafcUIXA/Xd4wNqyJg+qssfjdhVi785U
 FtG84Fw17Cx6NBiyBrT6cfEa8tcwfKc7yzbumsM0m44ATfSgML/iLMoVLiSXrYfbdLI4
 IsfvSHzcUMTfjN4IfGp7EmINqL21INols30h9a0PBuNiXJ+QK3bNe4/S45zuresyKuVx
 xwqSQGJvYN99dz51RMrBGZ4lu41oi48e/mvtNFsWWEk6ZtEdH79Ej0NJpkf07SBUB1+D
 2leLwcRvV/ZQT+cSHLcV1k6HIZFcTEV02JktgTQJKs6M7QYwcvVuljCaV7p9Y5f8wkns
 D2dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gOmIdC4XqjmnLw3K373OJjsFir2bp4J3M34k1oR3lAiS/MCG8PR986noslyi9BCTvFhYByAUY+7/p1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNgLZCkFjmxK3bd98lhyEmLIjtTSgkteMf8cSsWDZXywvFdkUE
 YdxxcVbduQFUJ16h4s2vmX2BkDr/z3LYkxR/MmiARl2qeDUxWUFHPnInlpH5eh2cBTenmtSQzDf
 E1zsFK9IeYKxklZ6CyTIGnPImCZ0QDFg=
X-Gm-Gg: AfdE7cmjiL4XWr4FvST1h85gLOcpl3j+CpSdquXv4jcANLqhL9W6flwffOnTVwEt7z9
 YKdIXcxVl07b1r+cSXhnRr/Jzs/BTnicGtI6sjcAbG9iX8pxEp8O2pzd5m4qEpwUqxYk6BTQseE
 qhN2c3r7C/iWM10NQQCh2WDe1LHIgzA8rZXlkauEZFML+2ZPK5pFoFMziXyaGsQjIO8QIUEqADB
 3/a0OQlKk0cHmx/qSDPINmm7sa2iaN5UMx1yqFoKUdYQdan0ReZRdZ2Luz8vk/9PraLKS6kPs/b
 xLBR8vVF7pVFZeHu7Hiw9Z2TBD0S
X-Received: by 2002:a05:690c:ec1:b0:7f8:7e31:28af with SMTP id
 00721157ae682-7fe5e3949a6mr25687807b3.49.1781687630339; Wed, 17 Jun 2026
 02:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260611104857.242153-1-guille.rodriguez@gmail.com>
 <ajJcxgVejqzlwo9A@zenone.zhora.eu>
In-Reply-To: <ajJcxgVejqzlwo9A@zenone.zhora.eu>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Wed, 17 Jun 2026 11:13:38 +0200
X-Gm-Features: AVVi8CcpI0W5riwjaqmESRlTpsqx7BYL6KjvKyJMbak5WMtWwLSsdGYOX4x2Jls
Message-ID: <CABDcavYH+=xrCA605me+6XrjV3QmVAqdfEmAC7SwFQBT4GHarQ@mail.gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: truncate clock period
	instead of rounding it
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:pierre-yves.mordret@st.com,m:linux-kernel@vger.kernel.org,m:wsa@kernel.org,m:linux-i2c@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:cedric.madianga@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:cedricmadianga@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[guillerodriguez@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[st.com,vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0E45697CD4

SGksCgpUaGFuayB5b3UgZXZlcnlvbmUuCgpBIHBvc3NpYmxlIGltcHJvdmVtZW50IHdvdWxkIGJl
IHRvIGRlcml2ZSB0aGUgY2xvY2sgcGVyaW9kIGluCnBpY29zZWNvbmRzIHJhdGhlciB0aGFuIG5z
IGFuZCBkbyBhbGwgdGhlIHRpbWluZyBjYWxjdWxhdGlvbnMgYmFzZWQgb24KdGhhdC4KVGhpcyB3
b3VsZCByZWR1Y2UgdGhlIHJvdW5kaW5nIGVycm9yIChmcm9tIG1heCAxbnMgdG8gbWF4IDFwcykg
YW5kCmhlbHAgdGhlIHNvbHZlciBmaW5kIFRJTUlOR1IgdmFsdWVzIGNsb3NlciB0byB0aGUgdGFy
Z2V0IGJ1cwpmcmVxdWVuY3ksIHdoaWxlIHN0aWxsIGtlZXBpbmcgYm90aCBmcmVxIGFuZCB0TE9X
IHdpdGhpbiBzcGVjLgoKSSB3YW50ZWQgdG8ga2VlcCB0aGlzIHBhdGNoIG1pbmltYWwgdG8gYWRk
cmVzcyB0aGUgc3BlYyB2aW9sYXRpb24KaXRzZWxmLCBhbmQgYWxzbyB0byBtYWtlIGl0IGVhc2ll
ciB0byBiYWNrcG9ydCB0byBzdGFibGUuIFRoZQpzdWdnZXN0ZWQgaW1wcm92ZW1lbnQgaXMgYSBi
aXQgbW9yZSBpbnZvbHZlZCwgYnV0IEkgd2FudGVkIHRvIG1lbnRpb24KaXQgaW4gY2FzZSB5b3Ug
d2FudCB0byBjb25zaWRlciBpdC4KClRoYW5rcywKCkd1aWxsZXJtbwoKCkVsIG1pw6ksIDE3IGp1
biAyMDI2IGEgbGFzIDEwOjM4LCBBbmRpIFNoeXRpICg8YW5kaS5zaHl0aUBrZXJuZWwub3JnPikg
ZXNjcmliacOzOgo+Cj4gSGkgR3VpbGxlcm1vLAo+Cj4gT24gVGh1LCBKdW4gMTEsIDIwMjYgYXQg
MTI6NDg6NTZQTSArMDIwMCwgR3VpbGxlcm1vIFJvZHLDrWd1ZXogd3JvdGU6Cj4gPiBzdG0zMmY3
X2kyY19jb21wdXRlX3RpbWluZygpIGRlcml2ZXMgdGhlIEkyQyBjbG9jayBzb3VyY2UgcGVyaW9k
Cj4gPiAoaTJjY2xrKSB3aXRoIERJVl9ST1VORF9DTE9TRVNULCB3aGljaCBtYXkgcm91bmQgaXQg
dXAuIFdoZW4gdGhlCj4gPiBwZXJpb2QgaXMgb3ZlcmVzdGltYXRlZCwgYWxsIHRpbWluZ3MgY29t
cHV0ZWQgZnJvbSBpdCAoU0NMREVMLAo+ID4gU0RBREVMLCBTQ0xMLCBTQ0xIKSBjb21lIG91dCBz
aG9ydGVyIG9uIHRoZSB3aXJlIHRoYW4gY2FsY3VsYXRlZCwKPiA+IGFuZCB0aGUgcmVzdWx0aW5n
IGJ1cyByYXRlIGNhbiBleGNlZWQgdGhlIHJlcXVlc3RlZCBzcGVlZCwgdmlvbGF0aW5nCj4gPiB0
aGUgSTJDIHNwZWNpZmljYXRpb24gbWluaW11bXMgZm9yIHRMT1cgYW5kIHRISUdILgo+ID4KPiA+
IEZvciBleGFtcGxlLCB3aXRoIGEgMTA0LjQ1IE1IeiBjbG9jayBzb3VyY2UgKGUuZy4gUENMSzEs
IHRoZQo+ID4gcmVzZXQtZGVmYXVsdCBJMkMgY2xvY2sgc291cmNlIG9uIFNUTTMyTVAxKSwgaTJj
Y2xrIGlzIHJvdW5kZWQgZnJvbQo+ID4gOS41NzQgbnMgdXAgdG8gMTAgbnMuIFJlcXVlc3Rpbmcg
YSA0MDAga0h6IGZhc3QgbW9kZSBidXMgd2l0aAo+ID4gNzIvMjcgbnMgcmlzZS9mYWxsIHRpbWVz
IGFuZCBubyBhbmFsb2cvZGlnaXRhbCBmaWx0ZXJzIHRoZW4gcHJvZHVjZXMKPiA+IGFuIGFjdHVh
bCBidXMgcmF0ZSBvZiA0MTUuNiBrSHogd2l0aCB0TE9XID0gMTI1NCBucywgdmlvbGF0aW5nIGJv
dGgKPiA+IHRoZSA0MDAga0h6IG1heGltdW0gcmF0ZSBhbmQgdGhlIDEzMDAgbnMgdExPVyBtaW5p
bXVtIG9mIHRoZQo+ID4gc3BlY2lmaWNhdGlvbi4KPiA+Cj4gPiBUcnVuY2F0ZSB0aGUgcGVyaW9k
IGluc3RlYWQsIHNvIHRoYXQgaXQgY2FuIG9ubHkgYmUgdW5kZXJlc3RpbWF0ZWQuCj4gPiBUaGUg
ZXJyb3IgdGhlbiBmYWxscyBvbiB0aGUgc2FmZSBzaWRlOiB0aGUgcHJvZ3JhbW1lZCB0aW1pbmdz
IGNvbWUKPiA+IG91dCBzbGlnaHRseSBsb25nZXIgdGhhbiBjb21wdXRlZCBhbmQgdGhlIGJ1cyBy
dW5zIG1hcmdpbmFsbHkgYmVsb3cKPiA+IHRoZSB0YXJnZXQgcmF0ZSAoMzc1LjMga0h6IGluIHRo
ZSBleGFtcGxlIGFib3ZlKSB3aGlsZSBtZWV0aW5nIHRoZQo+ID4gc3BlY2lmaWNhdGlvbi4KPiA+
Cj4gPiBpMmNidXMgaXMgbGVmdCByb3VuZGVkLXRvLWNsb3Nlc3Q6IGl0IGlzIG9ubHkgdXNlZCBh
cyB0aGUgdGFyZ2V0IG9mCj4gPiB0aGUgY2xrX2Vycm9yIGNvbXBhcmlzb24gYW5kIGlzIG5ldmVy
IG11bHRpcGxpZWQgaW50byB0aGUgcHJvZ3JhbW1lZAo+ID4gdGltaW5ncywgc28gbmVhcmVzdCBy
b3VuZGluZyByZW1haW5zIGFjY3VyYXRlIHRoZXJlLgo+ID4KPiA+IEZpeGVzOiBhZWIwNjhjNTcy
MTQgKCJpMmM6IGkyYy1zdG0zMmY3OiBhZGQgZHJpdmVyIikKPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGVybW8gUm9kcsOtZ3VleiA8Z3VpbGxl
LnJvZHJpZ3VlekBnbWFpbC5jb20+Cj4KPiBNZXJnZWQgdG8gaTJjL2kyYy1ob3N0Lgo+Cj4gVGhh
bmtzIHRvIEFsYWluIGFuZCBQaWVycmUtWXZlcyBmb3IgdGhlaXIgcmV2aWV3IQo+Cj4gQW5kaQoK
CgotLQpHdWlsbGVybW8gUm9kcmlndWV6IEdhcmNpYQpndWlsbGUucm9kcmlndWV6QGdtYWlsLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
