Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dy/3Hk1OT2oHeAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:31:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E172DB79
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 09:31:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=dUwrFa03;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=intel.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E746C8F289;
	Thu,  9 Jul 2026 07:31:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91001C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783582283; x=1815118283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cjMXLnfC6g6dIxN+DHVrz3kfjIpPNwD3v2Vrk7OqkFQ=;
 b=dUwrFa03toL+KxrlJf5HDqlyrf3l7QB/ABrkuWP69Opo7l8aiii/9Vzf
 6nzLYGY6+vgCmsyzZe1qg2BnJs9cWpzSonfQBDuxVcL4higrRX3/X0wuK
 uwCb5AAnM5dvQPW+rDeSQwp+ts9uSf8GMi+8e4WMylP7KO24Hq8XDS2Yk
 kYn6nbJ73NXkdDwbCcAZ3r7QIe+KuuBD6spA6q/Cl4AiTKzqU/lShccaX
 5kT8qJDMn8ct8DXF0FCc1YN1obt+40mo9lLvBrHXW8lAofek0tOO13qsw
 QRnQW9SSW6bGQP/ld92q7xwtJPz0RGWUp47JjBUXpd4ULOjlBj7t7WVpc g==;
X-CSE-ConnectionGUID: TJv6M8mDTvyS+M11YsZuPg==
X-CSE-MsgGUID: GiDBnyFUSRusTUNtGnbSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84356456"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84356456"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:31:18 -0700
X-CSE-ConnectionGUID: l77jRguWS0KUZDhOEz0AwA==
X-CSE-MsgGUID: c8A8Itj8SOiqwX6JveJBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="277729305"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:31:10 -0700
Date: Thu, 9 Jul 2026 10:31:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Message-ID: <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tony Lindgren <tony@atomide.com>, bjorn.andersson@oss.qualcomm.com,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 aniket.randive@oss.qualcomm.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
 uart_ops.pm callback
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:alexandre.belloni@bootlin.com,m:tony@atomide.com,m:bjorn.andersson@oss.qualcomm.com,m:claudiu.beznea@tuxon.dev,m:mukesh.savaliya@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:alim.akhtar@samsung.com,m:jacmet@sunsite.dk,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:aaro.koskinen@iki.fi,m:zhang.lyra@gmail.com,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:linux-serial@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:linux-omap@vger.kernel.org,m:michal.simek@amd.com,m:richard.genoud@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:konrad.dybcio@oss.qualcomm.com
 ,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:zhanglyra@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[bootlin.com,atomide.com,oss.qualcomm.com,tuxon.dev,samsung.com,sunsite.dk,kernel.org,st-md-mailman.stormreply.com,vger.kernel.org,iki.fi,gmail.com,armlinux.org.uk,linaro.org,lists.infradead.org,linux.alibaba.com,linux.intel.com,amd.com,collabora.com,alpha.franken.de,linuxfoundation.org,microchip.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,uart_ops.pm:url,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B18E172DB79

T24gVGh1LCBKdWwgMDksIDIwMjYgYXQgMTE6NTU6MTJBTSArMDUzMCwgUHJhdmVlbiBUYWxhcmkg
d3JvdGU6Cj4gVGhlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIGhhcyBiZWVuIGRlY2xhcmVkIHZvaWQg
c2luY2UgaXRzIGludHJvZHVjdGlvbiwKPiB3aGljaCBtZWFucyBhbnkgZXJyb3IgZnJvbSBhIGRy
aXZlcidzIHBvd2VyIG1hbmFnZW1lbnQgaW1wbGVtZW50YXRpb24gaXMKPiBzaWxlbnRseSBkaXNj
YXJkZWQgYnkgdWFydF9jaGFuZ2VfcG0oKS4gQmV5b25kIGxvc2luZyB0aGUgZXJyb3IKPiBpbmZv
cm1hdGlvbiwgdWFydF9jaGFuZ2VfcG0oKSB1bmNvbmRpdGlvbmFsbHkgdXBkYXRlcyBzdGF0ZS0+
cG1fc3RhdGUKPiBldmVuIHdoZW4gdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUgdHJhbnNpdGlvbiBm
YWlsZWQuIFRoaXMgY2F1c2VzIHRoZQo+IHNlcmlhbCBjb3JlIHRvIHRyYWNrIGEgcG93ZXIgc3Rh
dGUgdGhhdCBkb2VzIG5vdCByZWZsZWN0IHJlYWxpdHk6Cj4gc3Vic2VxdWVudCBjYWxscyB0byB1
YXJ0X2NoYW5nZV9wbSgpIHNlZSB0aGUgc3RhbGUgY2FjaGVkIHN0YXRlIGFzCj4gbWF0Y2hpbmcg
dGhlIHJlcXVlc3RlZCBzdGF0ZSBhbmQgc2tpcCB0aGUgY2FsbGJhY2sgZW50aXJlbHksIGxlYXZp
bmcgdGhlCj4gaGFyZHdhcmUgcGVybWFuZW50bHkgc3R1Y2sgd2l0aCBubyBmdXJ0aGVyIHJlY292
ZXJ5IGF0dGVtcHQuCj4gCj4gT24gbW9kZXJuIHBsYXRmb3JtcyB3aGVyZSB0aGUgLnBtIGNhbGxi
YWNrIHBlcmZvcm1zIHJlYWwgd29yayDigJQKPiBlbmFibGluZyBjbG9jayB0cmVlcywgaW50ZXJh
Y3Rpbmcgd2l0aCBydW50aW1lIFBNLCBhc3NlcnRpbmcgdm9sdGFnZQo+IHJlZ3VsYXRvcnMg4oCU
IHRoaXMgaXMgYSBjb3JyZWN0bmVzcyBnYXAuIEZhaWx1cmVzIGFyZSBpbnZpc2libGUgdG8gdGhl
Cj4gUE0gZnJhbWV3b3JrLCB0aGUgcG9ydCBwcm9jZWVkcyB0byBjYWxsIG9wcy0+c3RhcnR1cCgp
IG9uIHBvdGVudGlhbGx5Cj4gdW5wb3dlcmVkIGhhcmR3YXJlLCBhbmQgc3VzcGVuZC9yZXN1bWUg
ZXJyb3JzIGFyZSBoaWRkZW4gZnJvbSB0aGUgY29yZQo+IHRoYXQgbmVlZHMgdG8gaGFuZGxlIHRo
ZW0uCj4gCj4gVGhpcyBzZXJpZXMgZml4ZXMgdGhlIHByb2JsZW0gaW4gZm91ciBzdGVwczoKPiAK
PiAgIFBhdGNoIDEgY2hhbmdlcyB0aGUgdWFydF9vcHMucG0gY2FsbGJhY2sgc2lnbmF0dXJlIGZy
b20gdm9pZCB0byBpbnQsCj4gICB1cGRhdGVzIHVhcnRfY2hhbmdlX3BtKCkgdG8gcHJvcGFnYXRl
IGVycm9ycyBhbmQgb25seSBjb21taXQKPiAgIHN0YXRlLT5wbV9zdGF0ZSBvbiBzdWNjZXNzLCBh
bmQgaGFuZGxlcyB0aGUgcmV0dXJuIHZhbHVlIGF0IGV2ZXJ5Cj4gICBjYWxsIHNpdGUgaW4gc2Vy
aWFsX2NvcmUuYyB3aXRoIGFwcHJvcHJpYXRlIHBvbGljeSBwZXIgY29udGV4dAo+ICAgKHByb3Bh
Z2F0ZSwgbG9nLCBvciBza2lwLW9uLWZhaWx1cmUpLgo+IAo+ICAgUGF0Y2ggMiB1cGRhdGVzIHRo
ZSA4MjUwIGRyaXZlciBmYW1pbHk6IHNlcmlhbDgyNTBfZG9fcG0oKSBhbmQKPiAgIHNlcmlhbDgy
NTBfcG0oKSBhcmUgdXBkYXRlZCB0byByZXR1cm4gaW50ICh3aXRoIHRoZSBleHBvcnRlZCBzeW1i
b2wKPiAgIGRlY2xhcmF0aW9uIHVwZGF0ZWQgaW4gc2VyaWFsXzgyNTAuaCksIGFuZCB0aGUgODI1
MCBzdWItZHJpdmVyCj4gICBwbSBjYWxsYmFja3MgYXJlIHVwZGF0ZWQgdG8gcmV0dXJuIDAuCj4g
Cj4gICBQYXRjaCAzIHVwZGF0ZXMgdGhlIHJlbWFpbmluZyBub24tODI1MCBzZXJpYWwgZHJpdmVy
cy4gQWxsIC5wbQo+ICAgaW1wbGVtZW50YXRpb25zIGFyZSB1cGRhdGVkIHRvIHJldHVybiAwLiBU
aGUgc2gtc2NpIGZvcndhcmQKPiAgIGRlY2xhcmF0aW9uIHNoYXJlZCB3aXRoIHJzY2kgaXMgYWxz
byB1cGRhdGVkLgo+IAo+ICAgUGF0Y2ggNCB1cGRhdGVzIGFyY2gtbGV2ZWwgaW1wbGVtZW50YXRp
b25zOiBTQTExMDAgKGFzc2FiZXQsIGgzeHh4KSwKPiAgIE9NQVAxL2Ftcy1kZWx0YSAobW9kZW1f
cG0sIG5vdyBwcm9wYWdhdGVzIHJlZ3VsYXRvciBlcnJvcnMpLCBhbmQKPiAgIE1JUFMvQWxjaGVt
eSAoYWxjaGVteV84MjUwX3BtKS4KPiAKPiBBbGwgZXhpc3RpbmcgLnBtIGltcGxlbWVudGF0aW9u
cyByZXR1cm4gMCwgc28gdGhlcmUgaXMgbm8gZnVuY3Rpb25hbAo+IGNoYW5nZSBmb3IgYW55IGN1
cnJlbnQgZHJpdmVyLiBUaGUgc2VyaWVzIHB1cmVseSBhZGRzIHRoZSBpbmZyYXN0cnVjdHVyZQo+
IGZvciBkcml2ZXJzIHRvIHJlcG9ydCBlcnJvcnMgZ29pbmcgZm9yd2FyZCwgd2l0aCB0aGUgc2Vy
aWFsIGNvcmUgcmVhZHkKPiB0byBoYW5kbGUgdGhlbSBjb3JyZWN0bHkuCgpKdXN0IG5vLCBwbGVh
c2UganVzdCBwcm9wZXJseSBpbXBsZW1lbnQgcnVudGltZSBQTS4gVGhlIC5wbSgpIG11c3QgZGll
IGNvbXBsZXRlbHkuCkkgdXNlZCB0byBoYXZlIHRoZSBQb0MgZm9yIHRoYXQgbG9uZyB0aW1lIGFn
byBbMV0sIGJ1dCBkdWUgdG8gbGFjayBvZiB0aW1lIGFuZApvdGhlciBwcmlvcml0aWVzIGl0IHdl
bnQgYWJhbmRvbmVkLiBBbHNvIEF0bGFzc2lhbiBtYWRlIGEgYnJhaW4gZGFtYWdlcyBtb3ZlIHRv
CmxpbWl0IHJlcG9zaXRvcnkgdG8gMUdiLCBzbyBJIGhhdmVuJ3QgYWJsZSB0byB1cGRhdGUgaXQg
Zm9yIGEgZmV3IHllYXJzLgoKTm90ZSwgdGhhdCBUb255ICh5b3UgaGF2ZSBoaW0gaW4gdGhlIENj
IGxpc3QpIGRpZCBhIGxvdCBmb3Igc29tZSBjb3JuZXIgY2FzZXMKd2l0aCB0aGF0IGFuZCB3ZSBz
dGlsbCBoYXZlIHRoZW0gSUlSQy4gVG9ueSwgZG8geW91IGtub3cgd2hhdCBpcyB0aGUgc3RhdGUg
b2YKYWZmYWlycyB3aXRoIHJ1bnRpbWUgUE0gZm9yIFVBUlQ/CgpbMV06IGh0dHBzOi8vYml0YnVj
a2V0Lm9yZy9hbmR5LXNoZXYvbGludXgvYnJhbmNoL3RvcGljL3VhcnQvcnBtLXBsdXMKCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
