Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7PNQM3g7+2kQYQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 15:00:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 990304DAA56
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 15:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB219C8F289;
	Wed,  6 May 2026 13:00:38 +0000 (UTC)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76317C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 13:00:36 +0000 (UTC)
X-QQ-mid: esmtpgz13t1778072348t4051910c
X-QQ-Originating-IP: f3bsUKV8Yv9fAvdHOTDcH8/P4Nuy4zA3F7S2G3vmc0A=
Received: from [127.0.0.1] ( [116.234.74.217]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 06 May 2026 20:59:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 152799247874170222
Message-ID: <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Date: Wed, 6 May 2026 20:59:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MO1HcJ6CTmFs5V6LsL4+vdRDlmo8h2x5oQR3ZwRxCAkWUfGOtnBJnuua
 RUt2/0NnGa/6d2jJaZ/EjNJn0IRvNA6GrmBxcnx7LBXgd9c5/mVzyPi93bquiVmu15x+tR4
 0USh1SYsurDFlk06HChlowFvAqs2cjGA2VAUWqMMYHHbzeMgO9PPEzOqhhLd1YH0TQtwhfi
 KbJxEYo5z75ZM9eJXOgFdylkNqiymxRGVNzmrpsOwzwcxilX7saeNNIutVd7JKMXlqvMuzU
 a16e0fGvADKwlpvtcrBU+HPBmvd//WKVCcyNolAfkrgEPkm3xvtBLxuuA6/wtLloPvCBAxw
 Y0iuWZjj99EEAyG19w7sNePom1K99pSNhz4gAr0vBcxF2IhzH6EY+53SDY6hz2eirjLdEIq
 jKBZn5FrDxbOFRjcQYs0VbrZ4WW5kXe0yH/359vMjzYi0n3HWgbmyfWZklFMtg49k9Nxk13
 qJzRqII0JutdvKtsy6/yXD7JAsm98tm6kJ6DvgP52dPfJ6oV7UUC36DYFXTpJCPRBjnch7H
 4IYx198g3PYAY28ZheqGQLgEeQqYq+2QDTWFOsKLJh0g4mYI+ibDmtUaAcmMBaYcRwBnY9n
 9uNmsKsavqIwx69z40RHxur1CPR8bVDiYgWtjXjA2e/bg+38oh6SWptf3//AMp8m5ZfssQZ
 Ap/8s85Ul7P/CE6mlPF8foPPeonkxJ/ZlB9NV7RVpWboIXGzZwdllX/K6aHNcUw7L3lVSQH
 gLn+uLo6bSxIOdbNUu87o66riK5xs6zxgIvFvjIRsHgORJhP8I/jNQeqb2jH/V3kIcsWLGF
 XkwD6VcNCEYTGZ4VG26iKkW9rm+sfTBf5/MBu6UqGujtnySxuxPhoVPosSR6L4E6DqWsfM1
 I1cfTgTfYgDFDnApV2174FROdvKqIAHLYAJH6xe+52Y+FtBxDuFOPNu6k4aQkVjkKqvQtf0
 6AylZov2iS9lHVds2xxfQzBK4z1/oOsUYkIEkYyij0wwnKaNftIRWR7pzaRnGcn9HmsgqRM
 jSezwUCQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 990304DAA56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_MUA_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:li
 nux-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,radxa.com:mid,radxa.com:email]

On 5/1/2026 11:54 PM, Alex Elder wrote:
> +	/* AXI Configuration */
> +	axi = &td->axi;
> +	axi->axi_lpi_en = 1;
> +	axi->axi_wr_osr_lmt = 31;
> +	axi->axi_rd_osr_lmt = 31;
> +	/* All sizes (2^2..2^8) are supported */
> +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> +	plat->axi = axi;
> +
> +	plat->mac_port_sel_speed = speed;
> +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;

I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I 
guess it's required, since the driver clocks down the MAC/PMA/XPCS in 
its suspend hook?

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
