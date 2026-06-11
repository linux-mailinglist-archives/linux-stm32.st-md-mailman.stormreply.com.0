Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hilPGFiyKmrlvAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 15:04:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9BF67226E
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 15:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E63F5C9AE31;
	Thu, 11 Jun 2026 13:04:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1556C6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 13:04:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A11F4406E;
 Thu, 11 Jun 2026 13:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195281F00893;
 Thu, 11 Jun 2026 13:04:16 +0000 (UTC)
Message-ID: <9da8a414-4fef-40b0-928d-ce356c77ce7e@linux-m68k.org>
Date: Thu, 11 Jun 2026 23:04:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 00/10] add mcf54415 DAC driver
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adureghello@baylibre.com,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:linux-iio@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gerg@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[baylibre.com,linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,analog.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gerg@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E9BF67226E

SGkgQW5nZWxvLAoKT24gMTEvNi8yNiAwNjozNSwgQW5nZWxvIER1cmVnaGVsbG8gd3JvdGU6Cj4g
VGhpcyBwYXRjaHNldCBhZGRzIGEgbWluaW1hbGlzdGljIERBQyBkcml2ZXIgZm9yIHRoZSBOWFAg
bWNmNTQ0MTUvNi83LzgKPiBidWlsdGluIERBQ3MuCj4gCj4gQ3VycmVudGx5IHRoZSBkcml2ZXIg
ZW5hYmxlcyB0aGUgcmF3IHdyaXRlIG9ubHkuIEZlYXR1cmUgYXMgZG1hLCBzeW5jLCBvcgo+IGZv
cm1hdCBhcmUgbm90IHN1cG9wcnRlZCBmb3IgdGhpcyB2ZXJzaW9uLgo+IAo+IEFkZGl0aW9uYWwg
b3B0aW9ucyBzdXBwb2VydGVkIGJ5IHRoZSBEQUMgbW9kdWxlIHdpbGwgYmUgYWRkZWQgdG8gdGhl
IGRyaXZlcgo+IGxhdGVyIG9uLCBhcyBuZWVkZWQuCj4gCj4gVGhlIHNhbWUgcGF0Y2hzZXQgcHJl
cGFyZXMgdGhlIG02OGsvY29sZGZpcmUgYXJjaGl0ZWN0dXJlIHRvIHN1cHBvcnQKPiB0aGUgZHJp
dmVyLgo+IAo+IEJlbG93IHNvbWUgYmFzaWMgdGVzdHMgZG9uZSBvbiBzdG1hcmsyIG1jZjU0NDE1
LWJhc2VkIGJvYXJkLCB2b2x0YWdlIGNoZWNrCj4gb24gREFDMCBhbmQgREFDMToKPiAKPiB+ICMg
Y2QgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAvCj4gL3N5cy9idXMvaWlvL2Rldmlj
ZXMvaWlvOmRldmljZTAgIyBscwo+IG5hbWUgICAgICAgICAgICAgICBvdXRfdm9sdGFnZV9zY2Fs
ZSAgdWV2ZW50Cj4gb3V0X3ZvbHRhZ2VfcmF3ICAgIHN1YnN5c3RlbQo+IC9zeXMvYnVzL2lpby9k
ZXZpY2VzL2lpbzpkZXZpY2UwICMgY2F0IG5hbWUKPiBtY2Y1NDQxNQo+IC9zeXMvYnVzL2lpby9k
ZXZpY2VzL2lpbzpkZXZpY2UwICMgZWNobyA0MDk1ID4gb3V0X3ZvbHRhZ2VfcmF3Cj4gL3N5cy9i
dXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyBlY2hvIDIwNDggPiBvdXRfdm9sdGFnZV9yYXcK
PiAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGVjaG8gNDA5NiA+IG91dF92b2x0
YWdlX3Jhdwo+IHNoOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVudAo+IC9zeXMvYnVzL2lp
by9kZXZpY2VzL2lpbzpkZXZpY2UwICMgY2F0IG91dF92b2x0YWdlX3Jhdwo+IDIwNDgKPiAvc3lz
L2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjCj4gCj4gU2FtZSBiZWhhdmlvciBmb3IgL3N5
cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTEuCj4gCj4gR2VuZXJhdGVkIGEgc2luZSB3YXZl
IGJ5IHNoZWxsIHNjcmlwdCwgc2luZSBzaGFwZSBpcyBnb29kLgo+IAo+IGlzIGFjdHVhbGx5IGlu
IHByb2dyZXNzOgo+IAo+IE5vdGU6IHRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiBtZXcgbWNmX3Jl
YWQvbWNmX3dyaXRlIGltcGxlbWVudGF0aW9uIHRoYXQKPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tNjhrLzIwOWQwNjUzLTYzODYtNGI2NC05ZTE1LWUzNThmODQ0NTNhYkBh
cHAuZmFzdG1haWwuY29tL1QvI3QKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tNjhrLzIwMjYwNTA2MTQyNjQ0LjMyMzQyNzAtMi1nZXJnQGtlcm5lbC5vcmcvCj4gLS0tCj4g
Q2hhbmdlcyBpbiB2NToKPiAtIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNo
LCB3aGVyZSBhbnkKPiAtIExpbmsgdG8gdjQ6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2
MDUzMS13aXAtc3RtYXJrMi1kYWMtdjQtMC03ZTY1YWI0MjE1ZGRAYmF5bGlicmUuY29tCj4gCj4g
Q2hhbmdlcyBpbiB2NDoKPiAtIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNo
LCB3aGVyZSBhbnkKPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2
MDUyMi13aXAtc3RtYXJrMi1kYWMtdjMtMC0xNmJlMGFkMzVhNjdAYmF5bGlicmUuY29tCj4gCj4g
Q2hhbmdlcyBpbiB2MzoKPiAtIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNo
LCB3aGVyZSBhbnkKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2
MDUxMy13aXAtc3RtYXJrMi1kYWMtdjItMC1mY2RhZTUwY2Y1MWFAYmF5bGlicmUuY29tCj4gCj4g
Q2hhbmdlcyBpbiB2MjoKPiAtIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNo
LCB3aGVyZSBhbnkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2
MDUwNC13aXAtc3RtYXJrMi1kYWMtdjEtMC04NzRjMzZhNDkxMGRAYmF5bGlicmUuY29tCj4gCj4g
VG86IEdyZWcgVW5nZXJlciA8Z2VyZ0BsaW51eC1tNjhrLm9yZz4KPiBUbzogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBUbzogU3RldmVuIEtpbmcgPHNma2luZ0Bm
ZHdkYy5jb20+Cj4gVG86IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gVG86IE1heGlt
ZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBUbzogQWxleGFuZHJlIFRv
cmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBUbzogSm9uYXRoYW4gQ2FtZXJv
biA8amljMjNAa2VybmVsLm9yZz4KPiBUbzogRGF2aWQgTGVjaG5lciA8ZGxlY2huZXJAYmF5bGli
cmUuY29tPgo+IFRvOiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgo+IFRvOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KPiBDYzogR3JlZyBVbmdlcmVyIDxnZXJnQHVjbGlu
dXgub3JnPgo+IENjOiBsaW51eC1tNjhrQGxpc3RzLmxpbnV4LW02OGsub3JnCj4gQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBDYzogbGludXgtaWlvQHZnZXIua2VybmVsLm9yZwo+IAo+IC0tLQo+IEFuZ2VsbyBEdXJlZ2hl
bGxvICgxMCk6Cj4gICAgICAgIG02OGs6IG1jZjU0NDF4OiBmaXggY2xvY2tzIG51bWJlcmluZwo+
ICAgICAgICBtNjhrOiBtY2Y1NDQxeDogYWRkIGNsb2NrIGZvciBEQUMgY2hhbm5lbCAxCj4gICAg
ICAgIG02OGs6IGFkZCBEQUMgbW9kdWxlcyBiYXNlIGFkZHJlc3Nlcwo+ICAgICAgICBtNjhrOiBt
Y2Y1NDQxeDogYWRkIENDTSByZWdpc3RlcnMKPiAgICAgICAgbTY4azogbWNmNTQ0MXg6IGFkZCBD
Q1IgTUlTQ0NSMiBiaXRmaWVsZHMKPiAgICAgICAgbTY4azogc3RtYXJrMjogdXNlIGlvcG9ydC5o
IG1hY3JvcyBmb3IgcmVzb3VyY2VzCj4gICAgICAgIG02OGs6IHN0bWFyazI6IGFkZCBtY2Y1NDQx
eCBEQUMgcGxhdGZvcm0gZGV2aWNlcwo+ICAgICAgICBtNjhrOiBzdG1hcmsyOiBlbmFibGUgREFD
cyBvdXRwdXRzCj4gICAgICAgIGlpbzogZGFjOiBhZGQgbWNmNTQ0MTUgREFDCj4gICAgICAgIG02
OGs6IGRlZmNvbmZpZzogdXBkYXRlIHN0bWFyazIgZGVmY29uZmlnCj4gCj4gICBhcmNoL202OGsv
Y29sZGZpcmUvbTU0NDF4LmMgICAgICAgICB8ICAyMSArKy0tCj4gICBhcmNoL202OGsvY29sZGZp
cmUvc3RtYXJrMi5jICAgICAgICB8ICA0NyArKysrKy0tLQo+ICAgYXJjaC9tNjhrL2NvbmZpZ3Mv
c3RtYXJrMl9kZWZjb25maWcgfCAgIDIgKwo+ICAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQx
eHNpbS5oICAgfCAgNDIgKysrKysrKwo+ICAgZHJpdmVycy9paW8vZGFjL0tjb25maWcgICAgICAg
ICAgICAgfCAgMTEgKysKPiAgIGRyaXZlcnMvaWlvL2RhYy9NYWtlZmlsZSAgICAgICAgICAgIHwg
ICAxICsKPiAgIGRyaXZlcnMvaWlvL2RhYy9tY2Y1NDQxNV9kYWMuYyAgICAgIHwgMjE2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAzMTYg
aW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGRjZjkz
NTIwMTU3YzE3ZGRmYjFmNDNiNjZmY2RkYTI3NzE0ZmYxZGQKPiBjaGFuZ2UtaWQ6IDIwMjYwNDMw
LXdpcC1zdG1hcmsyLWRhYy03MDYwZjQ5ZGQ5NGYKCkkgYW0gaGFwcHkgd2l0aCBwYXRjaGVzIDEg
dGhyb3VnaCA4LCBJIHRoaW5rIHRoZXkgYXJlIHJlYWR5LgpJIGhhdmUgcHVzaGVkIHRoZW0gaW50
byB0aGUgZm9yLW5leHQgYnJhbmNoIG9mIHRoZSBtNjhrbm9tbXUgZ2l0IHRyZWUuCgpXaGVuIHRo
ZSBkcml2ZXIgcHJvcGVyIChwYXRjaCA5KSBlbmRzIGluIHVwIGluIG1haW5saW5lIHRoZW4gSSB3
aWxsCnB1c2ggdGhlIGRlZmNvbmZpZyB1cGRhdGUgKHBhdGNoIDEwKS4KClRoYW5rcwpHcmVnCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
