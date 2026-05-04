Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJcvAJfv+Gl93QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 21:12:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D44C308A
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 21:12:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A3AC56612;
	Mon,  4 May 2026 19:12:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE205C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 19:12:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso23250535e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2026 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777921940; x=1778526740;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
 b=KBWhg7+TgFQFLtNUOo0OSSqX3N6YztKfcwLaBG9bbefxCc/QWMZ5moSYZYyzOuUroH
 4Yp3iC9UrtJVcEJ5wVT/6XLGvdse2j6MV2to/0lhox6oIfSXWgzTU1dUVu0QAJUmTPP4
 nZGwmbWmgUAgEuYolxWffIa0PwiIDN2Gj9X+msx0db1u+xG2oPicb1b/v/8EQ8KN4Trx
 A65g1FjQGqx2Tds9cimlDxMJbsJS3CEOc7fNzp7uM1yXb0qyWs9mY8AWmLR6oIpMq7uS
 miHWMIS+SFLzrbgelJwE0Or9i8hXs8On0dBv2mKOs17fyYWdoV6ErcrW8oTsJ8LGCxln
 u0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777921940; x=1778526740;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQwjBGOlUox0oTO6Nb+xBFeGEpaCgvVAY6DNlLQtXZ0=;
 b=o8Wg4dIZ+8L5B5pXgflVCBfku3hE6iKxx57yK6qcsG4lkIWREuCGkJRz1tpWTC3963
 jsctcn9Ac2xwXpBivg8/JAqnvgRx6BBtQ841D2GFHz2aPktmlk2NObGRuDSw3snBYHZ1
 JXJUBJbnRGalVBMuLhqjcadwc4ANVsBIeGB95LxwFzzSEyoxUJk4TKbSSrnWv79bBFi1
 HCXEA5VT2y16VwlRuKpLu6l2aC0IRZwBGSEIx+zRTuKXjqhC8Up3D7fRThQmV/vM3MTM
 4XkxAos4I/lJQdFCgo4nOBnyPClB11ajqCIOP6mZAk+airo/5nK47WYoykPHX55JyN5L
 j1tQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UxALoDC5DTb9aKd9d+6zsC8eWhhAvMW89vkKXek/aVHUs6Q0lNOOhAX1+KnHKF1NksRTHSk9loQFiPg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxZYSLX+9Mq/H0grqZrYwhMEKlG59l0xAbnuriWBf/PqFwgtE1v
 2vCNETxFH/ntzQbNm21SUiqHXkIGNOPSljEjuDfiPH64sZAldcTs9k3Z
X-Gm-Gg: AeBDietWvbTpgFJx9jzx66PgbyfrNm4nVrxfRCA+EuP67VF6cHuy2f6MKz3/Ebwt9uf
 SP7X3GvvriwEdEDm22KtQmQPnRjacvnYUW/zbtLRMKKhBVJemiYZgpn9r3NPXMG1SfnxoLDDB4L
 h3m+OH/oqMn1vAMxK6pBlEhpKs8DWxpulNdo9mV4Kk3IdwsNu1x4742pB0d5cm8iqY9pPSgNze+
 /Mkkb14aoxG/3po+/38rKVS1rZKQBX9I+l07NJSMVyn7EwtQZPcYfmjy818Ldz9i9/Zyf2XnkjL
 GEZ3ejUZqZIAZrnllq6Y9I3jzkUdlNRTUtOhSWxSxtCm5XcF6IJkAC7dGFfDOfsLeZxQTUPEaBD
 FI07H6gDjNi/eKbRHTD8LPyu3tgxjCCajukVJZG/EHG1s97aawEoNYpzEBXGU4VSUyJxMfjNY2z
 3xTNtjWB6ET6sXXMAvsyMdmweinXcd1do3SY6ouP7QALe1EFo/rVsml4eDZsLx1rUqJHKlQaBZq
 XnZw8U6kBeD/rnlGvcXXss=
X-Received: by 2002:a05:600c:6215:b0:47e:e2eb:bc22 with SMTP id
 5b1f17b1804b1-48a988a9c49mr165080765e9.5.1777921939450; 
 Mon, 04 May 2026 12:12:19 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673?
 ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba6f83sm285124095e9.9.2026.05.04.12.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 12:12:19 -0700 (PDT)
Message-ID: <ab58ef97e0e2b20d04210ca0adda6a46a023ac00.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Angelo Dureghello <angelo@kernel-space.org>, Greg Ungerer	
 <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Steven
 King	 <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin	
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Jonathan Cameron	 <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 04 May 2026 20:13:19 +0100
In-Reply-To: <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-10-874c36a4910d@baylibre.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/10] iio: dac: add mcf54415 DAC
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
X-Rspamd-Queue-Id: 820D44C308A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:angelo@kernel-space.org,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nonamenuno@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel-space.org,linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.218];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[]

SGkgQW5nZWxvLAoKTWlub3Igc3R1ZmYgZnJvbSBtZQoKT24gTW9uLCAyMDI2LTA1LTA0IGF0IDE5
OjE2ICswMjAwLCBBbmdlbG8gRHVyZWdoZWxsbyB3cm90ZToKPiBGcm9tOiBBbmdlbG8gRHVyZWdo
ZWxsbyA8YWR1cmVnaGVsbG9AYmF5bGlicmUuY29tPgo+IAo+IEFkZCBiYXNpYyB2ZXJzaW9uIG9m
IG1jZjU0NDE1IERBQyBkcml2ZXIuIERBQyBpcyBlbWJlZGRlZCBpbiB0aGUgY3B1IGFuZAo+IERB
QyBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBhcmUgbWFwcGVkIGluIHRoZSBpbnRlcm5hbCBJTyBh
ZGRyZXNzIHNwYWNlLgo+IAo+IFRoZSBEQUMgYWNjZXB0cyBhIDEyLWJpdCBkaWdpdGFsIHNpZ25h
bCBhbmQgY3JlYXRlcyBhIG1vbm90b25pYyAxMi1iaXQKPiBhbmFsb2cgb3V0cHV0IHZhcnlpbmcg
ZnJvbSB+REFDX1ZSRUZMIHRvIH5EQUNfVlJFRkguIFRoZSBEQUMgbW9kdWxlCj4gY29uc2lzdHMg
b2YgYSBjb252ZXJzaW9uIHVuaXQsIGFuIG91dHB1dCBhbXBsaWZpZXIsIGFuZCB0aGUgYXNzb2Np
YXRlZAo+IGRpZ2l0YWwgY29udHJvbCBibG9ja3MuIERBQ19WUkVGTCBhbmQgREFDX1ZSRUZIIGRl
ZmF1bHRzIHJlc3BlY3RpdmxleSB0bwo+IDAgYW5kIDB4ZmZmLgo+IAo+IFRoaXMgaW5pdGlhbCB2
ZXJzaW9uIG9mIHRoZSBkcml2ZXIgaXMgbWluaW1hbGlzdGljLCAib3V0cHV0IHJhdyIgb25seSwg
dG8KPiBiZSBleHRlbmRlZCBpbiB0aGUgZnV0dXJlLiBETUEgYW5kIGV4dGVybmFsIHN5bmMgYXJl
IGRpc2FibGVkLCBkZWZhdWx0IG1vZGUKPiBpcyBoaWdoIHNwZWVkLCBkZWZhdWx0IGZvcm1hdCBp
cyByaWdodC1qdXN0aWZpZWQgMTJiaXQgb24gMTZiaXQgd29yZC4KPiAKPiBCYXNpYyB0ZXN0cyBk
b25lIG9uIHN0bWFyazIgbWNmNTQ0MTUtYmFzZWQgYm9hcmQsIHZvbHRhZ2UgY2hlY2sgb24gREFD
MDoKPiAKPiAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGxzCj4gbmFtZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG91dF92b2x0YWdlX3Jhd8KgwqDCoMKgwqAgc3Vi
c3lzdGVtCj4gb3V0X2NvbnZlcnNpb25fbW9kZcKgIG91dF92b2x0YWdlX3NjYWxlwqDCoMKgIHVl
dmVudAo+IAo+IC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMgY2F0IG5hbWUKPiBt
Y2Y1NDQxNV9kYWMuMAo+IAo+IC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMKPiAK
PiBlY2hvIDQwOTUgPiBvdXRfdm9sdGFnZV9yYXfCoMKgwqDCoCA9PiB2b2x0YWdlIGFidCAzLjNW
IGJ5IG9zY2lsbG9zY29wZQo+IGVjaG8gNDA5NiA+IG91dF92b2x0YWdlX3Jhd8KgwqDCoMKgID0+
IHJvbGwgb3ZlciB0byAwVgo+IGVjaG8gMCA+IG91dF92b2x0YWdlX3Jhd8KgwqDCoMKgwqDCoMKg
ID0+IHZvbHRhZ2UgaXMgMFYKPiBlY2hvIDIwNDggPiBvdXRfdm9sdGFnZV9yYXfCoMKgwqDCoCA9
PiB2b2x0YWdlIGlzIGFidCAxLjdWLCBtaWQgc2NhbGUKPiAKPiBTYW1lIGJlaGF2aW9yIGZvciAv
c3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMS4KPiAKPiBHZW5lcmF0ZWQgYSBzaW5lIHdh
dmUgYnkgc2hlbGwgc2NyaXB0LCBzaW5lIHNoYXBlIGlzIGdvb2QuCj4gCgpOb3Qgc3VyZSBpZiB0
aGUgYWJvdmUgZXhhbXBsZSBiZWxvbmdzIHRvIHRoZSBjb21taXQgbWVzc2FnZS4gSSB3b3VsZCBq
dXN0IHdyaXRlIGEKc21hbGwgZG9jIGlmIHlvdSByZWFsbHkgd2FudCB0byBkb2N1bWVudCB0aGUg
YWJvdmUuIFdlJ3JlIG5vdyBzZWVpbmcgbW9yZSBkb2NzIGZvcgpJSU8gZHJpdmVycy4KCj4gU2ln
bmVkLW9mZi1ieTogQW5nZWxvIER1cmVnaGVsbG8gPGFkdXJlZ2hlbGxvQGJheWxpYnJlLmNvbT4K
PiAtLS0KPiDCoGRyaXZlcnMvaWlvL2RhYy9LY29uZmlnwqDCoMKgwqDCoMKgwqAgfMKgIDEwICsr
Kwo+IMKgZHJpdmVycy9paW8vZGFjL01ha2VmaWxlwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+IMKg
ZHJpdmVycy9paW8vZGFjL21jZjU0NDE1X2RhYy5jIHwgMjAwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDIxMSBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2RhYy9LY29uZmlnIGIvZHJpdmVycy9p
aW8vZGFjL0tjb25maWcKPiBpbmRleCBjZDQ4NzBiNjU0MTUuLjE3NTUwZTk5Y2ZkZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2lpby9kYWMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvaWlvL2RhYy9L
Y29uZmlnCj4gQEAgLTUxNiw2ICs1MTYsMTYgQEAgY29uZmlnIE1BWDU4MjEKPiDCoAnCoCBTYXkg
eWVzIGhlcmUgdG8gYnVpbGQgc3VwcG9ydCBmb3IgTWF4aW0gTUFYNTgyMQo+IMKgCcKgIDEwIGJp
dHMgREFDLgo+IMKgCj4gK2NvbmZpZyBNQ0Y1NDQxNV9EQUMKPiArCXRyaXN0YXRlICJOWFAgTUNG
NTQ0MTUgREFDIGRyaXZlciIKPiArCWRlcGVuZHMgb24gTTU0NDF4Cj4gKwloZWxwCj4gKwnCoCBT
YXkgeWVzIGhlcmUgdG8gYnVpbGQgc3VwcG9ydCBmb3IgTlhQIE1DRjU0NDE1Cj4gKwnCoCAxMmJp
dCBEQUMuCj4gKwo+ICsJwqAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgY2hv
b3NlIE0gaGVyZTogdGhlIG1vZHVsZQo+ICsJwqAgd2lsbCBiZSBjYWxsZWQgbWNmNTQ0MTVfZGFj
Lgo+ICsKPiDCoGNvbmZpZyBNQ1A0NzI1Cj4gwqAJdHJpc3RhdGUgIk1DUDQ3MjUvNiBEQUMgZHJp
dmVyIgo+IMKgCWRlcGVuZHMgb24gSTJDCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2RhYy9N
YWtlZmlsZSBiL2RyaXZlcnMvaWlvL2RhYy9NYWtlZmlsZQo+IGluZGV4IDJhODBiYmY0ZTgwYS4u
MWNiOTNlODNkMGViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2RhYy9NYWtlZmlsZQo+ICsr
KyBiL2RyaXZlcnMvaWlvL2RhYy9NYWtlZmlsZQo+IEBAIC01MSw2ICs1MSw3IEBAIG9iai0kKENP
TkZJR19NQVg1MTcpICs9IG1heDUxNy5vCj4gwqBvYmotJChDT05GSUdfTUFYMjIwMDcpICs9IG1h
eDIyMDA3Lm8KPiDCoG9iai0kKENPTkZJR19NQVg1NTIyKSArPSBtYXg1NTIyLm8KPiDCoG9iai0k
KENPTkZJR19NQVg1ODIxKSArPSBtYXg1ODIxLm8KPiArb2JqLSQoQ09ORklHX01DRjU0NDE1X0RB
QykgKz0gbWNmNTQ0MTVfZGFjLm8KPiDCoG9iai0kKENPTkZJR19NQ1A0NzI1KSArPSBtY3A0NzI1
Lm8KPiDCoG9iai0kKENPTkZJR19NQ1A0NzI4KSArPSBtY3A0NzI4Lm8KPiDCoG9iai0kKENPTkZJ
R19NQ1A0N0ZFQjAyKSArPSBtY3A0N2ZlYjAyLm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8v
ZGFjL21jZjU0NDE1X2RhYy5jIGIvZHJpdmVycy9paW8vZGFjL21jZjU0NDE1X2RhYy5jCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQwMzFhNWRjMWY5ZAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL2lpby9kYWMvbWNmNTQ0MTVfZGFjLmMKPiBAQCAt
MCwwICsxLDIwMCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1s
YXRlcgo+ICsvKgo+ICsgKiBOWFAgbWNmNTQ0MTUgREFDIGRyaXZlcgo+ICsgKgo+ICsgKiBDb3B5
cmlnaHQgMjAyNiBCYXlMaWJyZSAtIGFkdXJlZ2hlbGxvQGJheWxpYnJlLmNvbQo+ICsgKi8KPiAr
Cj4gKyNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvYml0cy5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+
ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvbXV0ZXguaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2lpby9paW8uaD4KPiArCj4gKyNkZWZpbmUgTUNG
NTQ0MTVfREFDX0NSCQkJMHgwMAo+ICsjZGVmaW5lIE1DRjU0NDE1X0RBQ19DUl9QRE4JCUJJVCgw
KQo+ICsjZGVmaW5lIE1DRjU0NDE1X0RBQ19DUl9IU0xTCQlCSVQoNikKPiArI2RlZmluZSBNQ0Y1
NDQxNV9EQUNfQ1JfV01MVkwJCUdFTk1BU0soOSwgOCkKPiArI2RlZmluZSBNQ0Y1NDQxNV9EQUNf
Q1JfRklMVAkJQklUKDEyKQo+ICsKPiArI2RlZmluZSBNQ0Y1NDQxNV9EQUNfREFUQQkJMHgwMgo+
ICsKPiArI2RlZmluZSBNQ0Y1NDQxNV9EQUNfUkVBRFlfVVMJCTEyCj4gKwo+ICtzdHJ1Y3QgbWNm
NTQ0MTVfZGFjIHsKPiArCXN0cnVjdCBjbGsgKmNsazsKPiArCXN0cnVjdCBkZXZpY2UgKmRldjsK
PiArCXZvaWQgX19pb21lbSAqcmVnczsKPiArfTsKPiArCj4gK3N0YXRpYyB2b2lkIG1jZjU0NDE1
X2RhY19pbml0KHN0cnVjdCBtY2Y1NDQxNV9kYWMgKmluZm8pCj4gK3sKPiArCWludCB2YWw7Cj4g
Kwo+ICsJLyogS2VlcGluZyBkZWZhdWx0cyBhbmQgZW5hYmxlIERBQyAoYml0IDAgc2V0IHRvIDAp
ICovCj4gKwl2YWwgPSBNQ0Y1NDQxNV9EQUNfQ1JfRklMVDsKPiArCXZhbCB8PSBGSUVMRF9QUkVQ
KE1DRjU0NDE1X0RBQ19DUl9XTUxWTCwgMSk7Cj4gKwo+ICsJd3JpdGV3KHZhbCwgaW5mby0+cmVn
cyArIE1DRjU0NDE1X0RBQ19DUik7Cj4gKwo+ICsJLyogREFDIGlzIHJlYWR5IGFmdGVyIDEydXMs
IGZyb20gUk0gdGFibGUgNDAtM8KgICovCj4gKwlmc2xlZXAoTUNGNTQ0MTVfREFDX1JFQURZX1VT
KTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbWNmNTQ0MTVfZGFjX2V4aXQodm9pZCAqZGF0YSkK
PiArewo+ICsJc3RydWN0IG1jZjU0NDE1X2RhYyAqaW5mbyA9IGRhdGE7Cj4gKwlpbnQgdmFsOwo+
ICsKPiArCXZhbCA9IHJlYWR3KGluZm8tPnJlZ3MgKyBNQ0Y1NDQxNV9EQUNfQ1IpOwo+ICsJdmFs
IHw9IE1DRjU0NDE1X0RBQ19DUl9QRE47Cj4gKwl3cml0ZXcodmFsLCBpbmZvLT5yZWdzICsgTUNG
NTQ0MTVfREFDX0NSKTsKPiArfQo+ICsKPiArI2RlZmluZSBNQ0Y1NDQxNV9EQUNfQ0hBTiB7IFwK
PiArCS50eXBlID0gSUlPX1ZPTFRBR0UsIFwKPiArCS5vdXRwdXQgPSAxLCBcCj4gKwkuaW5mb19t
YXNrX3NlcGFyYXRlID0gQklUKElJT19DSEFOX0lORk9fUkFXKSwgXAo+ICsJLmluZm9fbWFza19z
aGFyZWRfYnlfdHlwZSA9IEJJVChJSU9fQ0hBTl9JTkZPX1NDQUxFKSwgXAo+ICt9Cj4gKwo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGlpb19jaGFuX3NwZWMgbWNmNTQ0MTVfZGFjX2lpb19jaGFubmVs
c1tdID0gewo+ICsJTUNGNTQ0MTVfREFDX0NIQU4KPiArfTsKPiArCj4gK3N0YXRpYyBpbnQgbWNm
NTQ0MTVfcmVhZF9yYXcoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKPiArCQkJc3RydWN0IGlp
b19jaGFuX3NwZWMgY29uc3QgKmNoYW4sCj4gKwkJCWludCAqdmFsLCBpbnQgKnZhbDIsCj4gKwkJ
CWxvbmcgbWFzaykKPiArewo+ICsJc3RydWN0IG1jZjU0NDE1X2RhYyAqaW5mbyA9IGlpb19wcml2
KGluZGlvX2Rldik7Cj4gKwo+ICsJc3dpdGNoIChtYXNrKSB7Cj4gKwljYXNlIElJT19DSEFOX0lO
Rk9fUkFXOgo+ICsJCSp2YWwgPSByZWFkdyhpbmZvLT5yZWdzICsgTUNGNTQ0MTVfREFDX0RBVEEp
Owo+ICsJCXJldHVybiBJSU9fVkFMX0lOVDsKPiArCWNhc2UgSUlPX0NIQU5fSU5GT19TQ0FMRToK
PiArCQkvKiBSZWZlcmVuY2Ugdm9sdGFnZSBhcyBwZXIgQ29sZEZpcmUgZGF0YXNoZWV0IGlzIDMu
M1YgKi8KPiArCQkqdmFsID0gMzMwMCAvKiBtViAqLzsKPiArCQkqdmFsMiA9IDEyOwo+ICsJCXJl
dHVybiBJSU9fVkFMX0ZSQUNUSU9OQUxfTE9HMjsKPiArCWRlZmF1bHQ6Cj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgbWNm
NTQ0MTVfd3JpdGVfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCj4gKwkJCXN0cnVjdCBp
aW9fY2hhbl9zcGVjIGNvbnN0ICpjaGFuLAo+ICsJCQlpbnQgdmFsLCBpbnQgdmFsMiwKPiArCQkJ
bG9uZyBtYXNrKQo+ICt7Cj4gKwlzdHJ1Y3QgbWNmNTQ0MTVfZGFjICppbmZvID0gaWlvX3ByaXYo
aW5kaW9fZGV2KTsKPiArCj4gKwlzd2l0Y2ggKG1hc2spIHsKPiArCWNhc2UgSUlPX0NIQU5fSU5G
T19SQVc6Cj4gKwkJd3JpdGV3KHZhbCwgaW5mby0+cmVncyArIE1DRjU0NDE1X0RBQ19EQVRBKTsK
PiArCQlyZXR1cm4gMDsKPiArCgpObyBuZWVkIGZvciB0aGUgbmV3IGxpbmUuCgo+ICsJZGVmYXVs
dDoKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBpaW9faW5mbyBtY2Y1NDQxNV9kYWNfaWlvX2luZm8gPSB7Cj4gKwkucmVhZF9yYXcgPSAm
bWNmNTQ0MTVfcmVhZF9yYXcsCj4gKwkud3JpdGVfcmF3ID0gJm1jZjU0NDE1X3dyaXRlX3JhdywK
PiArfTsKPiArCj4gK3N0YXRpYyBpbnQgbWNmNTQ0MTVfZGFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7Cj4gKwlz
dHJ1Y3QgbWNmNTQ0MTVfZGFjICppbmZvOwo+ICsJaW50IHJldDsKPiArCj4gKwlpbmRpb19kZXYg
PSBkZXZtX2lpb19kZXZpY2VfYWxsb2MoJnBkZXYtPmRldiwKPiArCQkJCQnCoCBzaXplb2Yoc3Ry
dWN0IG1jZjU0NDE1X2RhYykpOwoKU2xpZ2h0IHByZWZlcmVuY2UgZm9yIHNpemVvZigqaW5mbykK
Cj4gKwlpZiAoIWluZGlvX2RldikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlpbmZvID0g
aWlvX3ByaXYoaW5kaW9fZGV2KTsKPiArCWluZm8tPmRldiA9ICZwZGV2LT5kZXY7Cj4gKwo+ICsJ
aW5mby0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiAr
CWlmIChJU19FUlIoaW5mby0+cmVncykpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYt
PmRldiwgUFRSX0VSUihpbmZvLT5yZWdzKSwKPiArCQkJCcKgwqDCoMKgICJmYWlsZWQgdG8gZ2V0
IGlvIHJlZ3NcbiIpOwo+ICsKPiArCWluZm8tPmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZw
ZGV2LT5kZXYsICJkYWMiKTsKPiArCWlmIChJU19FUlIoaW5mby0+Y2xrKSkKPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKGluZm8tPmNsayksCj4gKwkJCQnCoMKg
wqDCoCAiZmFpbGVkIGdldHRpbmcgY2xvY2tcbiIpOwo+ICsKPiArCXBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIGluZGlvX2Rldik7Cj4gKwo+IAo+ICsJaW5kaW9fZGV2LT5uYW1lID0gZGV2X25h
bWUoJnBkZXYtPmRldik7CgpKdXN0IHVzZSAibWNmNTQ0MTUiLiAKCj4gKwlpbmRpb19kZXYtPmlu
Zm8gPSAmbWNmNTQ0MTVfZGFjX2lpb19pbmZvOwo+ICsJaW5kaW9fZGV2LT5tb2RlcyA9IElORElP
X0RJUkVDVF9NT0RFOwo+ICsJaW5kaW9fZGV2LT5jaGFubmVscyA9IG1jZjU0NDE1X2RhY19paW9f
Y2hhbm5lbHM7Cj4gKwlpbmRpb19kZXYtPm51bV9jaGFubmVscyA9IEFSUkFZX1NJWkUobWNmNTQ0
MTVfZGFjX2lpb19jaGFubmVscyk7Cj4gKwo+ICsJbWNmNTQ0MTVfZGFjX2luaXQoaW5mbyk7Cj4g
Kwo+ICsJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZwZGV2LT5kZXYsIG1jZjU0NDE1
X2RhY19leGl0LCBpbmZvKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwly
ZXQgPSBkZXZtX2lpb19kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgaW5kaW9fZGV2KTsKPiAr
CWlmIChyZXQpCj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiY291bGRuJ3QgcmVnaXN0ZXIgdGhl
IGRldmljZVxuIik7Cj4gKwoKSSB3b3VsZCBqdXN0IHJldHVybiBkZXZtX2lpb19kZXZpY2VfcmVn
aXN0ZXIoKTsKCi0gTnVubyBTw6EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
