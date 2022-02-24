Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC444C2C2F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Feb 2022 13:53:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C8F9C5F1D7;
	Thu, 24 Feb 2022 12:53:57 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2855C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 12:53:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3504F1F44A;
 Thu, 24 Feb 2022 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645707235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G7Q4/SbY0/u6FJFyQ5u7ok3xEUfxBWHs/wk8cUfVjo=;
 b=UPAiUuz+WH8h7pPxSNNG6Dpza+Qb+DM5ZsIxaWxc1kG25pDybpqYRQX9kVy96n/KQltFxM
 vCZj0mVEeW3p5oSQ+Rdkp5XuV/rGPiV4X0Q4CY3EpPGaEBOzTiQGkDt8cbMTH188U9lC2M
 4/y8+BgA/LqcXC5UeGyUaGQEyyqilIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645707235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G7Q4/SbY0/u6FJFyQ5u7ok3xEUfxBWHs/wk8cUfVjo=;
 b=PIqZ3B1fxD+QIGOx68q/WUrx7rRxAgTPIf32nkK4Qbync3bJbDpyVAY9lHUo4LrfE3UD9a
 22Slgo4cEHRrhsBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5311B13AD9;
 Thu, 24 Feb 2022 12:53:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d5/wEOJ/F2IoEgAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Thu, 24 Feb 2022 12:53:54 +0000
Message-ID: <f62148d7-6f7a-3557-e3ca-3a261b61ac9d@suse.de>
Date: Thu, 24 Feb 2022 15:53:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: ru
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
From: Denis Kirjanov <dkirjanov@suse.de>
In-Reply-To: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com, Lars Persson <larper@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: only enable DMA
	interrupts when ready
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

CgoyLzI0LzIyIDE0OjM4LCBWaW5jZW50IFdoaXRjaHVyY2gg0L/QuNGI0LXRgjoKPiBJbiB0aGlz
IGRyaXZlcidzIC0+bmRvX29wZW4oKSBjYWxsYmFjaywgaXQgZW5hYmxlcyBETUEgaW50ZXJydXB0
cywKPiBzdGFydHMgdGhlIERNQSBjaGFubmVscywgdGhlbiByZXF1ZXN0cyBpbnRlcnJ1cHRzIHdp
dGggcmVxdWVzdF9pcnEoKSwKPiBhbmQgdGhlbiBmaW5hbGx5IGVuYWJsZXMgbmFwaS4KPiAKPiBJ
ZiBSWCBETUEgaW50ZXJydXB0cyBhcmUgcmVjZWl2ZWQgYmVmb3JlIG5hcGkgaXMgZW5hYmxlZCwg
bm8gcHJvY2Vzc2luZwo+IGlzIGRvbmUgYmVjYXVzZSBuYXBpX3NjaGVkdWxlX3ByZXAoKSB3aWxs
IHJldHVybiBmYWxzZS4gIElmIHRoZSBuZXR3b3JrCj4gaGFzIGEgbG90IG9mIGJyb2FkY2FzdC9t
dWx0aWNhc3QgdHJhZmZpYywgdGhlbiB0aGUgUlggcmluZyBjb3VsZCBmaWxsIHVwCj4gY29tcGxl
dGVseSBiZWZvcmUgbmFwaSBpcyBlbmFibGVkLiAgV2hlbiB0aGlzIGhhcHBlbnMsIG5vIGZ1cnRo
ZXIgUlgKPiBpbnRlcnJ1cHRzIHdpbGwgYmUgZGVsaXZlcmVkLCBhbmQgdGhlIGRyaXZlciB3aWxs
IGZhaWwgdG8gcmVjZWl2ZSBhbnkKPiBwYWNrZXRzLgo+IAo+IEZpeCB0aGlzIGJ5IG9ubHkgZW5h
YmxpbmcgRE1BIGludGVycnVwdHMgYWZ0ZXIgYWxsIG90aGVyIGluaXRpYWxpemF0aW9uCj4gaXMg
Y29tcGxldGUuCj4gCj4gRml4ZXM6IDUyM2YxMWI1ZDRmZDcyZWZiICgibmV0OiBzdG1tYWM6IG1v
dmUgaGFyZHdhcmUgc2V0dXAgZm9yIHN0bW1hY19vcGVuIHRvIG5ldyBmdW5jdGlvbiIpCj4gUmVw
b3J0ZWQtYnk6IExhcnMgUGVyc3NvbiA8bGFycGVyQGF4aXMuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFZpbmNlbnQgV2hpdGNodXJjaCA8dmluY2VudC53aGl0Y2h1cmNoQGF4aXMuY29tPgo+IC0tLQo+
ICAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgMjggKysr
KysrKysrKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfbWFpbi5jCj4gaW5kZXggNjcwOGNhMmFhNGY3Li40Mzk3ODU1OGQ2YzAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMKPiBAQCAtMjI2MCw2ICsyMjYwLDIzIEBAIHN0YXRpYyB2b2lkIHN0bW1hY19zdG9wX3R4
X2RtYShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsIHUzMiBjaGFuKQo+ICAgCXN0bW1hY19zdG9w
X3R4KHByaXYsIHByaXYtPmlvYWRkciwgY2hhbik7Cj4gICB9Cj4gICAKPiArc3RhdGljIHZvaWQg
c3RtbWFjX2VuYWJsZV9hbGxfZG1hX2lycShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpCj4gK3sK
PiArCXUzMiByeF9jaGFubmVsc19jb3VudCA9IHByaXYtPnBsYXQtPnJ4X3F1ZXVlc190b191c2U7
Cj4gKwl1MzIgdHhfY2hhbm5lbHNfY291bnQgPSBwcml2LT5wbGF0LT50eF9xdWV1ZXNfdG9fdXNl
Owo+ICsJdTMyIGRtYV9jc3JfY2ggPSBtYXgocnhfY2hhbm5lbHNfY291bnQsIHR4X2NoYW5uZWxz
X2NvdW50KTsKPiArCXUzMiBjaGFuOwo+ICsKPiArCWZvciAoY2hhbiA9IDA7IGNoYW4gPCBkbWFf
Y3NyX2NoOyBjaGFuKyspIHsKPiArCQlzdHJ1Y3Qgc3RtbWFjX2NoYW5uZWwgKmNoID0gJnByaXYt
PmNoYW5uZWxbY2hhbl07Cj4gKwkJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKwkJc3Bpbl9s
b2NrX2lycXNhdmUoJmNoLT5sb2NrLCBmbGFncyk7Cj4gKwkJc3RtbWFjX2VuYWJsZV9kbWFfaXJx
KHByaXYsIHByaXYtPmlvYWRkciwgY2hhbiwgMSwgMSk7Cj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmY2gtPmxvY2ssIGZsYWdzKTsKPiArCX0KPiArfQo+ICsKPiAgIC8qKgo+ICAgICogc3Rt
bWFjX3N0YXJ0X2FsbF9kbWEgLSBzdGFydCBhbGwgUlggYW5kIFRYIERNQSBjaGFubmVscwo+ICAg
ICogQHByaXY6IGRyaXZlciBwcml2YXRlIHN0cnVjdHVyZQo+IEBAIC0yOTAyLDggKzI5MTksMTAg
QEAgc3RhdGljIGludCBzdG1tYWNfaW5pdF9kbWFfZW5naW5lKHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdikKPiAgIAkJc3RtbWFjX2F4aShwcml2LCBwcml2LT5pb2FkZHIsIHByaXYtPnBsYXQtPmF4
aSk7Cj4gICAKPiAgIAkvKiBETUEgQ1NSIENoYW5uZWwgY29uZmlndXJhdGlvbiAqLwo+IC0JZm9y
IChjaGFuID0gMDsgY2hhbiA8IGRtYV9jc3JfY2g7IGNoYW4rKykKPiArCWZvciAoY2hhbiA9IDA7
IGNoYW4gPCBkbWFfY3NyX2NoOyBjaGFuKyspIHsKPiAgIAkJc3RtbWFjX2luaXRfY2hhbihwcml2
LCBwcml2LT5pb2FkZHIsIHByaXYtPnBsYXQtPmRtYV9jZmcsIGNoYW4pOwpEaWQgeW91IG1pc3Mg
dG8gdGFrZSBhIGNoYW5uZWwgbG9jaz8KPiArCQlzdG1tYWNfZGlzYWJsZV9kbWFfaXJxKHByaXYs
IHByaXYtPmlvYWRkciwgY2hhbiwgMSwgMSk7Cj4gKwl9Cj4gICAKPiAgIAkvKiBETUEgUlggQ2hh
bm5lbCBDb25maWd1cmF0aW9uICovCj4gICAJZm9yIChjaGFuID0gMDsgY2hhbiA8IHJ4X2NoYW5u
ZWxzX2NvdW50OyBjaGFuKyspIHsKPiBAQCAtMzc1OSw2ICszNzc4LDcgQEAgc3RhdGljIGludCBz
dG1tYWNfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ICAgCj4gICAJc3RtbWFjX2VuYWJs
ZV9hbGxfcXVldWVzKHByaXYpOwo+ICAgCW5ldGlmX3R4X3N0YXJ0X2FsbF9xdWV1ZXMocHJpdi0+
ZGV2KTsKPiArCXN0bW1hY19lbmFibGVfYWxsX2RtYV9pcnEocHJpdik7Cj4gICAKPiAgIAlyZXR1
cm4gMDsKPiAgIAo+IEBAIC02NTA4LDggKzY1MjgsMTAgQEAgaW50IHN0bW1hY194ZHBfb3Blbihz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ICAgCX0KPiAgIAo+ICAgCS8qIERNQSBDU1IgQ2hhbm5l
bCBjb25maWd1cmF0aW9uICovCj4gLQlmb3IgKGNoYW4gPSAwOyBjaGFuIDwgZG1hX2Nzcl9jaDsg
Y2hhbisrKQo+ICsJZm9yIChjaGFuID0gMDsgY2hhbiA8IGRtYV9jc3JfY2g7IGNoYW4rKykgewo+
ICAgCQlzdG1tYWNfaW5pdF9jaGFuKHByaXYsIHByaXYtPmlvYWRkciwgcHJpdi0+cGxhdC0+ZG1h
X2NmZywgY2hhbik7Cj4gKwkJc3RtbWFjX2Rpc2FibGVfZG1hX2lycShwcml2LCBwcml2LT5pb2Fk
ZHIsIGNoYW4sIDEsIDEpOwo+ICsJfQo+ICAgCj4gICAJLyogQWRqdXN0IFNwbGl0IGhlYWRlciAq
Lwo+ICAgCXNwaF9lbiA9IChwcml2LT5ody0+cnhfY3N1bSA+IDApICYmIHByaXYtPnNwaDsKPiBA
QCAtNjU3MCw2ICs2NTkyLDcgQEAgaW50IHN0bW1hY194ZHBfb3BlbihzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2KQo+ICAgCXN0bW1hY19lbmFibGVfYWxsX3F1ZXVlcyhwcml2KTsKPiAgIAluZXRpZl9j
YXJyaWVyX29uKGRldik7Cj4gICAJbmV0aWZfdHhfc3RhcnRfYWxsX3F1ZXVlcyhkZXYpOwo+ICsJ
c3RtbWFjX2VuYWJsZV9hbGxfZG1hX2lycShwcml2KTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAg
Cj4gQEAgLTc0NDcsNiArNzQ3MCw3IEBAIGludCBzdG1tYWNfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAgIAlzdG1tYWNfcmVzdG9yZV9od192bGFuX3J4X2ZsdHIocHJpdiwgbmRldiwgcHJp
di0+aHcpOwo+ICAgCj4gICAJc3RtbWFjX2VuYWJsZV9hbGxfcXVldWVzKHByaXYpOwo+ICsJc3Rt
bWFjX2VuYWJsZV9hbGxfZG1hX2lycShwcml2KTsKPiAgIAo+ICAgCW11dGV4X3VubG9jaygmcHJp
di0+bG9jayk7Cj4gICAJcnRubF91bmxvY2soKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
