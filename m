Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OhMA5ywu2k8mgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:15:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF642C7BAD
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 09:15:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC4BC87ED3;
	Thu, 19 Mar 2026 08:15:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A531DC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ay74TMh014iR7nkSfjsS4NxcUBQqZWrWwmUFvdZ+uTc=; b=N8U5LMwOvrosPl6nOVMMteuKVW
 sTe7HQrBy06spxIvUzVkz3BHiznipoV4TylXKQYaLjUGrXcqsJV6zFjMqADDLaBTU/l1Jx2fnM92R
 JqNXoaJTFHHkd9ibx2CqvxaH+R6STvuSBF8c81fGugte8jjRpjqYFxptpFfKdUJXC/42DnXYObj6H
 UkOO6fUS5YTkP+SbcbBfqrqGQdQ4e+pgTe107Mr3yS/Pi0wMVk3wzI7fBu/JZK48rYbo35sh29dZE
 FQlyzRoj/XXnTzBCuqgYkunW0rilS/w0qDqpk7ErNsUr4KtuGJ3GYtEG+85jmcVLDJX8PAkK93F4n
 04y9qy3w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45380)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w38Wt-000000004SZ-48nU;
 Thu, 19 Mar 2026 08:14:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w38Wf-000000007z5-1pDU; Thu, 19 Mar 2026 08:14:41 +0000
Date: Thu, 19 Mar 2026 08:14:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <abuwcYH791D_oJp_@shell.armlinux.org.uk>
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com>
 <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
 <CAMdnO-LYAPfyvM4vgmGcZgy-aagHSkP+VDmpRskNU-414j3gnQ@mail.gmail.com>
 <CAMdnO-+YWowCDh4iB9EZ=eqUidE6Mu4TOqjwyoMgyEaG=pBLBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-+YWowCDh4iB9EZ=eqUidE6Mu4TOqjwyoMgyEaG=pBLBg@mail.gmail.com>
Cc: quic_abchauha@quicinc.com, vladimir.oltean@nxp.com, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, ast@kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 4/5] net: stmmac: Add PCI
 driver support for BCM8958x
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:quic_abchauha@quicinc.com,m:vladimir.oltean@nxp.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:andr
 ew@lunn.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,nxp.com,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.166];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,armlinux.org.uk:url,stormreply.com:email,stormreply.com:url,broadcom.com:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 9FF642C7BAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMTE6MTI6MjNQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gSGkgUnVzc2VsbCwKPiBPbiBNb24sIE1hciAxNiwgMjAyNiBhdCAxOjM04oCv
UE0gSml0ZW5kcmEgVmVnaXJhanUKPiA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPiB3
cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCA0OjAx4oCvUE0gUnVzc2VsbCBL
aW5nIChPcmFjbGUpCj4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4KPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgcGxhdC0+c3VzcGVuZCAgICAgICAgICAgPSBzdG1tYWNfcGNp
X3BsYXRfc3VzcGVuZDsKPiA+ID4gPiArICAgICBwbGF0LT5yZXN1bWUgICAgICAgICAgICA9IGJy
Y21fcGNpX3Jlc3VtZTsKPiA+ID4gPiArICAgICBwbGF0LT5ic3BfcHJpdiA9IGJyY21fcHJpdjsK
PiA+ID4KPiA+ID4gUG9wdWxhdGluZyBzdXNwZW5kL3Jlc3VtZSBtZWFucyB0aGF0IHBsYXQtPmlu
aXQgYW5kIHBsYXQtPmV4aXQKPiA+ID4gd2lsbCBvbmx5IGJlIGNhbGxlZCBvbiBkcml2ZXIgcHJv
YmUgKGZvcm1lciksIHByb2JlIGZhaWx1cmUgKGxhdHRlcikKPiA+ID4gb3IgcmVtb3ZlIChsYXR0
ZXIpLiBQbGVhc2UgY29uc2lkZXIgdXNpbmcgdGhlc2UgdG8gZW5zdXJlIHRoYXQKPiA+ID4gYWxs
IGFwcHJvcHJpYXRlIHJlc291cmNlcyBhcmUgcHJvcGVybHkgY2xlYW5lZCB1cCBpbiBhbGwgY2Fz
ZXMuCj4gPiA+Cj4gPgo+ID4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIGNo
ZWNrIHJlc291cmNlIGNsZWFudXAgbW9yZSBjbG9zZWx5Lgo+IEFmdGVyIHJldmlld2luZyB0aGUg
bmVlZCBmb3IgIHBsYXQtPmluaXQgYW5kIHBsYXQtZXhpdCwgSSBkb24ndCB0aGluayB3ZSBuZWVk
Cj4gdGhlc2UgaGFuZGxlcnMgYXMgdGhpcyBkcml2ZXIgd2l0aCBmaXhlZC1saW5rIGRvZXNuJ3Qg
bmVlZCB0byByZXN0b3JlIGFueSBkZXZpY2UKPiBzcGVjaWZpYyBzdGF0ZSBzdWNoIGFzIGNsb2Nr
cy4KCkh1aD8KCnBsYXQtPmluaXQgYW5kIHBsYXQtPmV4aXQgaGF2ZSBub3RoaW5nIHRvIGRvIHdp
dGggInJlc3RvcmluZyIgYW55dGhpbmcuCgpwbGF0LT5pbml0IGlzIGZvciBwbGF0Zm9ybSBzcGVj
aWZpYyBpbml0aWFsaXNhdGlvbi4KCnBsYXQtPmV4aXQgaXMgZm9yIHJldmVyc2luZyB0aGUgZWZm
ZWN0cyBvZiBwbGF0LT5pbml0IG9uY2UgcGxhdC0+aW5pdApoYXMgc3VjZWVkZWQsIGFuZCB3aWxs
IGJlIGNhbGxlZCBzaG91bGQgdGhlIHByb2JlIGZhaWwgb3Igb24gZGV2aWNlCnJlbW92YWwuCgpT
bywgd2hlcmUgeW91IGhhdmU6CgpzdGF0aWMgaW50IGZvb19wcm9iZSgpCnsKCWRvIGluaXQgc3R1
ZmYoKTsKCglyZXQgPSBzdG1tYWNfZHZyX3Byb2JlKCk7CglpZiAocmV0KQoJCWdvdG8gY2xlYW51
cDsKCglyZXR1cm4gMDsKCmNsZWFudXA6CglkbyBjbGVhbnVwIHN0dWZmKCk7CgoJcmV0dXJuIHJl
dDsKfQoKc3RhdGljIHZvaWQgZm9vX3JlbW92ZSgpCnsKCXN0bW1hY19kdnJfcmVtb3ZlKCk7Cglk
byBjbGVhbnVwIHN0dWZmKCk7Cn0KClVzaW5nIC0+aW5pdCBmb3IgImRvIGluaXQgc3R1ZmYoKSIg
YW5kIC0+ZXhpdCBmb3IgImRvIGNsZWFudXAgc3R1ZmYoKSIKd2lsbCBzaW1wbGlmeSB0aGUgY29k
ZSwgYW5kIGFjdHVhbGx5IG1ha2UgdGhpbmdzIG1vcmUgY29ycmVjdC4KCkN1cnJlbnRseSwgeW91
IGhhdmUgdGhpcyBpbiB5b3VyIHJlbW92ZSBwYXRoOgoKKyAgICAgICBwY2lfZnJlZV9pcnFfdmVj
dG9ycyhwZGV2KTsKKyAgICAgICBkZXZpY2Vfc2V0X25vZGUoJnBkZXYtPmRldiwgTlVMTCk7Cisg
ICAgICAgc29mdHdhcmVfbm9kZV91bnJlZ2lzdGVyX25vZGVfZ3JvdXAoYnJjbV9zd25vZGVzKTsK
CmJ1dCBpbiB5b3VyIHByb2JlIGVycm9yIHBhdGgsIHlvdSBoYXZlIGZhaWx1cmUgcGF0aHMgdGhh
dCBsZWF2ZQp0aGUgc3dub2RlIGNvbm5lY3RlZCB0byB0aGUgZGV2aWNlLCBhbmQgeW91IGRvbid0
IGNhbGwKc29mdHdhcmVfbm9kZV91bnJlZ2lzdGVyX25vZGVfZ3JvdXAoKS4gVGh1cywgaXQgc2Vl
bXMgdG8gbWUgdGhhdAp5b3VyIGNsZWFudXAgcGF0aCBpcyBidWdneS4KCk15IHN1Z2dlc3Rpb24g
b2YgdXNpbmcgLT5pbml0IGFuZCAtPmV4aXQgbWVhbnMgeW91IGhhdmUgc2xpZ2h0bHkKbGVzcyB0
byB0aGluayBhYm91dCB3aGVuIHN0bW1hY19kdnJfcHJvYmUoKSBmYWlscyAtIGFsdGhvdWdoIGlm
CnlvdSBzdGlsbCBoYXZlIHRvIGRvIGFwcHJvcHJpYXRlIGNsZWFudXAgd2l0aGluIC0+aW5pdCBp
ZiBpdApwYXJ0aWFsbHkgZmFpbHMuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3
dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBz
IGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
