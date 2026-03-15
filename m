Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAs8M4Tgtmn2JwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 17:38:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637242917BA
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 17:38:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF04FC01FB6;
	Sun, 15 Mar 2026 16:38:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A8E2C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 16:38:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64AD2600CB;
 Sun, 15 Mar 2026 16:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A308C4CEF7;
 Sun, 15 Mar 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773592705;
 bh=WrNeMYsAA03DHVECs98FC7knzVMNjLmWyKvwlzN4Krw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODlndx/l2BTSbPjRspV9GLT7+5T3/4XNm1uJzTAR5k+bHedYGFbm7JcgrzbAMgwWW
 h3t+0iwi22VFwi/vk45Kz2w9HYLdExgXOq8xBGIQKNkp/kZKGRqwYWpyQfSimyVgB7
 WrKPZMlYKJl6FxwhgiR9lK+Hi0KC8ofixzUzYoWcVFS2xLl6FqTtVBCdp6trj9wHFZ
 G1cjoMWJmWsNxRMB0F4r6FJFjTbPCymS+hka/0zDBbmt7PBcrnAvIG9To3of5IcfVp
 JWhdazvUhIMZ2QhFYQA0dxWVuzXyQyBnyelMGJ1ME9cZe/XmLRTuJJVXnFz+VDnPI7
 1D2bXfJj7EFFg==
Date: Sun, 15 Mar 2026 22:08:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Message-ID: <skfqxnugt4t7eidfny5ojczq3wpu4u5yjfd6wdk3ikjmbgru7t@63nfqvrl5mvs>
References: <20260312130229.2282001-12-cassel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312130229.2282001-12-cassel@kernel.org>
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kselftest@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Shuah Khan <shuah@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, linux-tegra@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Koichiro Den <den@valinux.co.jp>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v4 00/10] PCI: endpoint: Differentiate
 between disabled and reserved BARs
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:shuah@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:arnd@arndb.de,m:srikanth.thokala@intel.com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:mmaddireddy@nvidia.com,m:dlemoal@kernel.org,m:bhelgaas@google.com,m:linux-omap@vger.kernel.org,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@
 vger.kernel.org,m:christian.bruel@foss.st.com,m:gregkh@linuxfoundation.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:den@valinux.co.jp,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:jingoohan1@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,arndb.de,intel.com,pengutronix.de,google.com,foss.st.com,linuxfoundation.org,renesas.com,valinux.co.jp,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 637242917BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgMDI6MDI6MjhQTSArMDEwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBIZWxsbyBhbGwsCj4gCj4gVGhpcyBzZXJpZXMgd2FzIG9yaWdpbmFsbHkgd3JpdHRl
biBpbiByZXNwb25zZSB0byB0aGUgcGF0Y2ggc2VyaWVzIGZyb20KPiBNYW5pa2FudGEgTWFkZGly
ZWRkeSB0aGF0IHdhcyBwb3N0ZWQgaGVyZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1wY2kvMjkxZGFiNjUtM2ZhNi00ZmM4LTkwYTItNGFkNjA4Y2EwMTVjQG52aWRpYS5jb20vVC8j
dAo+IAo+IE1hbmlrYW50YSBoYXMgcmV2aWV3ZWQgdGhpcyBzZXJpZXMgYW5kIHdpbGwgc2VuZCBh
IHNtYWxsIHNlcmllcyBvbiB0b3Agb2YKPiB0aGlzIG9uZS4KPiAKCkFwcGxpZWQgdG8gcGNpL2Vu
ZHBvaW50LCB0aGFua3MhCgotIE1hbmkKCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MzoKPiAtTW9kaWZp
ZWQgcGF0Y2ggMSB0byBzaW1wbHkgZHJvcCBCQVJfUkVTRVJWRUQgZm9yIGEgQkFSIGZvbGxvd2lu
ZyBhbgo+ICBvbmx5XzY0Yml0IEJBUiAoTWFuaXZhbm5hbikuCj4gLUFkZGVkIGEgcGF0Y2ggZnJv
bSBNYW5pa2FudGEsIHRvIG1ha2UgaGlzIGZvbGxvdy11cCBzZXJpZXMgc21hbGxlciwKPiAgc2lu
Y2UgdGhpcyBzZXJpZXMgdG91Y2hlcyB0aGUgc2FtZSBsaW5lcyBhbnl3YXkuCj4gCj4gTGluayB0
byB2MzoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyNjAzMDIwOTU5MTMu
NDgxNTUtMTEtY2Fzc2VsQGtlcm5lbC5vcmcvCj4gCj4gCj4gS29pY2hpcm8gRGVuICgyKToKPiAg
IFBDSTogZW5kcG9pbnQ6IERlc2NyaWJlIHJlc2VydmVkIHN1YnJlZ2lvbnMgd2l0aGluIEJBUnMK
PiAgIFBDSTogZHctcm9ja2NoaXA6IERlc2NyaWJlIFJLMzU4OCBCQVI0IERNQSBjdHJsIHdpbmRv
dwo+IAo+IE1hbmlrYW50YSBNYWRkaXJlZGR5ICgxKToKPiAgIFBDSTogZW5kcG9pbnQ6IEFsbG93
IG9ubHlfNjRiaXQgb24gQkFSX1JFU0VSVkVECj4gCj4gTmlrbGFzIENhc3NlbCAoNyk6Cj4gICBQ
Q0k6IGVuZHBvaW50OiBEbyBub3QgbWFyayB0aGUgQkFSIHN1Y2NlZWRpbmcgYSA2NC1iaXQgQkFS
IGFzCj4gICAgIEJBUl9SRVNFUlZFRAo+ICAgUENJOiBlbmRwb2ludDogSW50cm9kdWNlIHBjaV9l
cGNfYmFyX3R5cGUgQkFSX0RJU0FCTEVECj4gICBQQ0k6IGR3YzogUmVwbGFjZSBjZXJ0YWluIEJB
Ul9SRVNFUlZFRCB3aXRoIEJBUl9ESVNBQkxFRCBpbiBnbHVlCj4gICAgIGRyaXZlcnMKPiAgIFBD
STogZHdjOiBEaXNhYmxlIEJBUnMgaW4gY29tbW9uIGNvZGUgaW5zdGVhZCBvZiBpbiBlYWNoIGds
dWUgZHJpdmVyCj4gICBQQ0k6IGVuZHBvaW50OiBwY2ktZXBmLXRlc3Q6IEFkdmVydGlzZSByZXNl
cnZlZCBCQVJzCj4gICBtaXNjOiBwY2lfZW5kcG9pbnRfdGVzdDogR2l2ZSByZXNlcnZlZCBCQVJz
IGEgZGlzdGluY3QgZXJyb3IgY29kZQo+ICAgc2VsZnRlc3RzOiBwY2lfZW5kcG9pbnQ6IFNraXAg
cmVzZXJ2ZWQgQkFScwo+IAo+ICBkcml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3QuYyAgICAg
ICAgICAgICAgfCAyMSArKysrKysrKy0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
LWRyYTd4eC5jICAgICAgIHwgIDQgLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
LWlteDYuYyAgICAgICAgIHwgMjIgKysrLS0tLS0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaS1rZXlzdG9uZS5jICAgICB8IDEyICsrKysrCj4gIC4uLi9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWxheWVyc2NhcGUtZXAuYyAgICB8ICA2IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWFydHBlYzYuYyAgICAgfCAgNCAtLQo+ICAuLi4vcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jICAgfCAyNCArKysrKysrKysrCj4gIC4uLi9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLXBsYXQuYyB8IDEwIC0tLS0KPiAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5jIHwgMjMgKysrKysrLS0tLQo+ICBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtlZW1iYXkuYyAgICAgfCAgMyAtLQo+ICBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYyAgICAgfCAxMiAtLS0tLQo+
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXJjYXItZ2VuNC5jICAgfCAxNiArKy0t
LS0tCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzItZXAuYyAgICB8IDEw
IC0tLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jICAgIHwg
MTkgKystLS0tLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS11bmlwaGllci1l
cC5jIHwgMTkgKy0tLS0tLS0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJjYXItZXAu
YyAgICAgICAgIHwgIDMgLS0KPiAgZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL3BjaS1l
cGYtdGVzdC5jIHwgMjQgKysrKysrKysrKwo+ICBkcml2ZXJzL3BjaS9lbmRwb2ludC9wY2ktZXBj
LWNvcmUuYyAgICAgICAgICAgfCAgNSArLQo+ICBpbmNsdWRlL2xpbnV4L3BjaS1lcGMuaCAgICAg
ICAgICAgICAgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKystLS0tCj4gIC4uLi9wY2lfZW5k
cG9pbnQvcGNpX2VuZHBvaW50X3Rlc3QuYyAgICAgICAgICB8ICA0ICsrCj4gIDIwIGZpbGVzIGNo
YW5nZWQsIDE1NCBpbnNlcnRpb25zKCspLCAxMzMgZGVsZXRpb25zKC0pCj4gCj4gCj4gYmFzZS1j
b21taXQ6IDBiNzRmN2Q3MjM5OWQ0YzQ0MjJlZDNkNjhlZjI4YjM2MTJmNzFlNzQKPiAtLSAKPiAy
LjUzLjAKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/
4K614K6u4K+NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
