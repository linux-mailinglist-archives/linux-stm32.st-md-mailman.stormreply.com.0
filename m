Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E4oZKbFjT2orfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8872EA0F
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Yd+vR+Ri;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=CKSMxQZe;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9432C9AE33;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A780EC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 06:26:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66960Zgl837402
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Jul 2026 06:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UFMApzgUBiN57ks2oOsTxl0jxniFCalkMhusL1AmBmM=; b=Yd+vR+RiSzmU2zUV
 hZyKp52vpLsGuVzyaT3zoiCIQJ9LFu/DteNpajO0H43/bxH1s2YGKkgl6MANM3HP
 0egOPDeL69RG9qjtaZEfkEFX+a0Y2ywQpdbfx8pwJii51VqEV7acKw9tQNY9LdB9
 96ZN8G+ShctTdORDYx5YoKavz6FFQmM4bX4fi7Go+FVhQh4FwfC8kPoATDv76FMS
 Zer+/y2MD3WKPVItAcKOprBxYYX9AzINFpOtKEDHqpGh2i271ucW7rrhJ+gXH8C8
 YuwC3+8XQoo52D4lrgPQ68v5L/LKW2VkjHVjIGqcTxboeu1e7ONRU/Ay6RTtDKTf
 b2PJZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwap4q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 06:26:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cce02cb769so20758175ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783578368; x=1784183168;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UFMApzgUBiN57ks2oOsTxl0jxniFCalkMhusL1AmBmM=;
 b=CKSMxQZeIcG8P6s+x3yZQYC107mF5KT+d43/LP/xaXWWYAoXP7MusGevJ33C18KMNY
 funXpTNh08QV7q6p7fagPQzUAr8M8DyBQHUOdYli8CRArsvRDVkIlEiLRgDZBECKFtNO
 v1cldXJIoR5+539ti4o0c1Psp4nZLbepwdSaDuadUoRN0cOdB+LxP/vYiOnM0kGupmRK
 XtWGRnAM2wl08TIKO21Ldy2hk41eu08vIHIhH9PYQrggk6X+bjSMZuzj1TBNmxNWZid0
 hlVqBvRZbhJFr3ivObAcr/YsxvPfs4s/+z0R4/mQ2LzrLtJLJL/7Z6ncBCAQDPbQz1JO
 ei+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783578368; x=1784183168;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UFMApzgUBiN57ks2oOsTxl0jxniFCalkMhusL1AmBmM=;
 b=lajo/2MSNyJ5t6WxR9BOsGqeyFpDv+IfgRcTP//wDu0KNXQFtWyCpGyfhghCqWstDF
 z/pbDV6l3RZ4t3YvgBEIeGMl09ZucOQNUYoZ1xgYJqYPMoQlvYV+0PXBKeh2RUJ1bpnq
 D3Bk97+iWHiLpjgVIKdWF+bd+B8Io7iY0+omY6vpg7OimgKtgbF2o+/zT3VkmjmyMXrQ
 Fj0cxylPS+vKIEZbZ6kIzNX6fM9DLK7bJ3AMVxzSbe4rGYWC29JxQIM7n9KarJ8ZKiXT
 Wb4q/8jCsEnUpuBWcTHbHmhWY3YmuFBsdA9ZuOy04MEqlgUyfa41T2sjLyjvbNAWlau+
 sA6w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKzNs93gjs0W2nYtuOpijQlefVTwPAqvFNflmW3ALLqgOKP3s5Sm0NEPpOU+aPGgxsAYnXTf7p6LU44w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6PZxtdY7iYFIolx2FoMoChxaN92UgjOXGNo7Kd49g7FqgZVHc
 oIQhnJCtoBGSFaJSd9ltYOSGkz7YN42DASqIFjmBBhZe7VNwQbloPcSHl6ZulfCOw1xiBeH6Ihw
 oC1UI5IGobTgKu5T+UUcxz5lTXFD2wQPIODMsVsG1okpHKcy80q2qhfR86DUxZGMcxjNEsOw3ON
 RbTJXxAyc=
X-Gm-Gg: AfdE7cm9nLDZWVOtx9h4ANzU+Xnyw4cUWgFpMeo4wUcc1t73ldT8nHxxUe29+jaIU2U
 ynaDufsDkZlph8dsxYrvkhVwvRMthkaVe8M0XRRRCaNE2ZUidFG0bOqBqgnm3gkXMjWy4W735qO
 NrhWKO6+qUVNMPs9ycPtHFgtCBw2nMxIHyWjrV8ootqpVnCP29ntdliPxPZuBpPyc956Wl+htfw
 Hivq/0k7K2lqccK53bhbIiFL1VCME8c2TjNl8zEVvMHHtX23LlWQL/eKYDjy6B9sSKzawhDC4ki
 7+YZ1BncFW2TKDHfADY4dm+49T4VNPqQQ3LmvCHWVB46WRGsnTx83+Lgd7mRqbsiaZR13egeju1
 DoUm8vKIuDqUZj0+jH7ItXu6omnd1qm+RwTWHGTY7ggqu
X-Received: by 2002:a17:903:298f:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2ccea3485b7mr72525175ad.5.1783578368297; 
 Wed, 08 Jul 2026 23:26:08 -0700 (PDT)
X-Received: by 2002:a17:903:298f:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2ccea3485b7mr72524695ad.5.1783578367691; 
 Wed, 08 Jul 2026 23:26:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 23:26:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:15 +0530
MIME-Version: 1.0
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-3-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Michal Simek <michal.simek@amd.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 bjorn.andersson@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=13929;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=qUNkuXWrcdVtB04kDk+E37DmPlOZJrpTJArSzZKtMVY=;
 b=33rkx3Q4diRf5acWplYLWUgebCOis8BKueJFS0I1nhVhOUHCzaYBEY5s9tR3bAH/jgTDLPvqW
 9Aj9nwmg8NDAZZ7wCZoP7YsLbPjTm+0VnDUDzUnj92SYWNFfEGZTZMo
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX6pW1RTljboFu
 lEGOGMAptgxrCO98CHo8KixfrdXZYjlg1Rb6zeYqXehTMz9HNr31A6Bz9HGonqu4jLSzQzCY3CK
 D4JS7iAI7L4S1JTPjWdk0xgzso6+0eyY+odTb0UAgiSQmqEpc61+4wbjDmlTNI1lm98pabS07D+
 LCDppN0whxCs2pZY1ok+pgIUcCMWg+r4OOqfZ/WEgdAldEu0gaWnhLSyw/3ZTY85yRArn2gO6kh
 ESoUkLLZ/YjN61UoMV2Mpaud0HZbuPFoS8u+WTv173jL3Nup2Hc5hJKAVerinMVd2++hVvpAygn
 Qute/h3zQb2FAdJs4MqVR1h/1DKCcsFzLUuoiO+E6wqERDCr2bjw+Uo0Lkgfv9XSMyY/kY/TKqx
 TExmFqKY0mFrm9QepaiRFkFFCet8VuOGBHjJyeVhqQPoKDJ7hZDeEY4mo3LIHtrWQ01XelE3AnX
 SyYUJu0zTWlaZEmtBAg==
X-Proofpoint-GUID: m4V_5HGFI9sxht8tNRhAsC4WrbPXpfzO
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f3f01 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5x3-L-KNCuIJjzK26vwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: m4V_5HGFI9sxht8tNRhAsC4WrbPXpfzO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX0DHkuZFxn2+V
 weIIkP8g3Eig3tpQTJVdk+RnBqzWc4uDUcxRWsdl1Mum5r5BDTBrkmI6RCkiKpYGgrDVO86R0lb
 R0S3IWl78ecen9OXPloXjr04JqVd2fw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090058
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: linux-samsung-soc@vger.kernel.org, aniket.randive@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Praveen Talari <praveen.talari@oss.qualcomm.com>,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] tty: serial: update .pm callbacks to
	return int
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:chand
 ana.chiluveru@oss.qualcomm.com,m:linux-mediatek@lists.infradead.org,m:linux-serial@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uart_ops.pm:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70C8872EA0F

The uart_ops.pm callback signature has been changed from void to int.
Update all remaining non-8250 serial driver .pm implementations to match
the new signature by returning 0.

The sh-sci driver exports sci_pm() for reuse by rsci.c; update the
forward declaration in sh-sci-common.h accordingly.

Drivers updated:
  atmel_serial:    atmel_serial_pm()
  dz:              dz_pm()
  fsl_lpuart:      lpuart_uart_pm()
  msm_serial:      msm_power()
  omap-serial:     serial_omap_pm()
  pxa:             serial_pxa_pm()
  qcom_geni_serial: qcom_geni_serial_pm()
  samsung_tty:     s3c24xx_serial_pm()
  sc16is7xx:       sc16is7xx_pm()
  serial_txx9:     serial_txx9_pm()
  sh-sci/rsci:     sci_pm()
  sprd_serial:     sprd_pm()
  st-asc:          asc_pm()
  stm32-usart:     stm32_usart_pm()
  uartlite:        ulite_pm()
  xilinx_uartps:   cdns_uart_pm()
  zs:              zs_pm()

No functional change intended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/atmel_serial.c     | 5 +++--
 drivers/tty/serial/fsl_lpuart.c       | 3 ++-
 drivers/tty/serial/msm_serial.c       | 5 +++--
 drivers/tty/serial/omap-serial.c      | 3 ++-
 drivers/tty/serial/pxa.c              | 3 ++-
 drivers/tty/serial/qcom_geni_serial.c | 5 +++--
 drivers/tty/serial/samsung_tty.c      | 5 +++--
 drivers/tty/serial/sc16is7xx.c        | 5 +++--
 drivers/tty/serial/serial_txx9.c      | 3 ++-
 drivers/tty/serial/sh-sci-common.h    | 4 ++--
 drivers/tty/serial/sh-sci.c           | 5 +++--
 drivers/tty/serial/sprd_serial.c      | 5 +++--
 drivers/tty/serial/st-asc.c           | 5 +++--
 drivers/tty/serial/stm32-usart.c      | 5 +++--
 drivers/tty/serial/uartlite.c         | 5 +++--
 drivers/tty/serial/xilinx_uartps.c    | 5 +++--
 16 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 5d8c1cfc1c60..bcbcb77d4df8 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2063,8 +2063,8 @@ static void atmel_shutdown(struct uart_port *port)
 /*
  * Power / Clock management.
  */
-static void atmel_serial_pm(struct uart_port *port, unsigned int state,
-			    unsigned int oldstate)
+static int atmel_serial_pm(struct uart_port *port, unsigned int state,
+			   unsigned int oldstate)
 {
 	struct atmel_uart_port *atmel_port = to_atmel_uart_port(port);
 
@@ -2095,6 +2095,7 @@ static void atmel_serial_pm(struct uart_port *port, unsigned int state,
 	default:
 		dev_err(port->dev, "atmel_serial: unknown pm %d\n", state);
 	}
+	return 0;
 }
 
 /*
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b7919c05f0fb..a6b6fb7aca88 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -820,7 +820,7 @@ static void lpuart32_start_tx(struct uart_port *port)
 	}
 }
 
-static void
+static int
 lpuart_uart_pm(struct uart_port *port, unsigned int state, unsigned int oldstate)
 {
 	switch (state) {
@@ -832,6 +832,7 @@ lpuart_uart_pm(struct uart_port *port, unsigned int state, unsigned int oldstate
 		pm_runtime_get_sync(port->dev);
 		break;
 	}
+	return 0;
 }
 
 /* return TIOCSER_TEMT when transmitter is not busy */
diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 2e999cb9c974..33b663a3514c 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -1421,8 +1421,8 @@ static int msm_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return 0;
 }
 
-static void msm_power(struct uart_port *port, unsigned int state,
-		      unsigned int oldstate)
+static int msm_power(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate)
 {
 	struct msm_port *msm_port = to_msm_port(port);
 
@@ -1440,6 +1440,7 @@ static void msm_power(struct uart_port *port, unsigned int state,
 	default:
 		pr_err("msm_serial: Unknown PM state %d\n", state);
 	}
+	return 0;
 }
 
 #ifdef CONFIG_CONSOLE_POLL
diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index a689d190940c..5029821e3559 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -1017,7 +1017,7 @@ serial_omap_set_termios(struct uart_port *port, struct ktermios *termios,
 	dev_dbg(up->port.dev, "serial_omap_set_termios+%d\n", up->port.line);
 }
 
-static void
+static int
 serial_omap_pm(struct uart_port *port, unsigned int state,
 	       unsigned int oldstate)
 {
@@ -1035,6 +1035,7 @@ serial_omap_pm(struct uart_port *port, unsigned int state,
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 	serial_out(up, UART_EFR, efr);
 	serial_out(up, UART_LCR, 0);
+	return 0;
 }
 
 static void serial_omap_release_port(struct uart_port *port)
diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index 10fc8990579b..1f6541f251f9 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -507,7 +507,7 @@ serial_pxa_set_termios(struct uart_port *port, struct ktermios *termios,
 	uart_port_unlock_irqrestore(&up->port, flags);
 }
 
-static void
+static int
 serial_pxa_pm(struct uart_port *port, unsigned int state,
 	      unsigned int oldstate)
 {
@@ -517,6 +517,7 @@ serial_pxa_pm(struct uart_port *port, unsigned int state,
 		clk_prepare_enable(up->clk);
 	else
 		clk_disable_unprepare(up->clk);
+	return 0;
 }
 
 static void serial_pxa_release_port(struct uart_port *port)
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..17ab8acb3b8e 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1724,8 +1724,8 @@ static int geni_serial_resource_init(struct uart_port *uport)
 	return 0;
 }
 
-static void qcom_geni_serial_pm(struct uart_port *uport,
-		unsigned int new_state, unsigned int old_state)
+static int qcom_geni_serial_pm(struct uart_port *uport,
+			       unsigned int new_state, unsigned int old_state)
 {
 
 	/* If we've never been called, treat it as off */
@@ -1738,6 +1738,7 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		 old_state == UART_PM_STATE_ON)
 		pm_runtime_put_sync(uport->dev);
 
+	return 0;
 }
 
 /**
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 63d0232dffc2..4d35112cb153 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1290,8 +1290,8 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
-			      unsigned int old)
+static int s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
+			     unsigned int old)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
 	int timeout = 10000;
@@ -1318,6 +1318,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 	default:
 		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
 	}
+	return 0;
 }
 
 /* baud rate calculation
diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index daebd92f32c7..47fec6c5e3c2 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1216,10 +1216,11 @@ static int sc16is7xx_verify_port(struct uart_port *port,
 	return 0;
 }
 
-static void sc16is7xx_pm(struct uart_port *port, unsigned int state,
-			 unsigned int oldstate)
+static int sc16is7xx_pm(struct uart_port *port, unsigned int state,
+			unsigned int oldstate)
 {
 	sc16is7xx_power(port, (state == UART_PM_STATE_ON) ? 1 : 0);
+	return 0;
 }
 
 static void sc16is7xx_null_void(struct uart_port *port)
diff --git a/drivers/tty/serial/serial_txx9.c b/drivers/tty/serial/serial_txx9.c
index 4ae9a45c8e3a..e97dea43708a 100644
--- a/drivers/tty/serial/serial_txx9.c
+++ b/drivers/tty/serial/serial_txx9.c
@@ -680,7 +680,7 @@ serial_txx9_set_termios(struct uart_port *up, struct ktermios *termios,
 	uart_port_unlock_irqrestore(up, flags);
 }
 
-static void
+static int
 serial_txx9_pm(struct uart_port *port, unsigned int state,
 	      unsigned int oldstate)
 {
@@ -694,6 +694,7 @@ serial_txx9_pm(struct uart_port *port, unsigned int state,
 	 */
 	if (state == 0 && oldstate != -1)
 		serial_txx9_initialize(port);
+	return 0;
 }
 
 static int serial_txx9_request_resource(struct uart_port *up)
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 01ff9fced803..2f03750094df 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -44,8 +44,8 @@ void sci_release_port(struct uart_port *port);
 int sci_request_port(struct uart_port *port);
 void sci_config_port(struct uart_port *port, int flags);
 int sci_verify_port(struct uart_port *port, struct serial_struct *ser);
-void sci_pm(struct uart_port *port, unsigned int state,
-		   unsigned int oldstate);
+int sci_pm(struct uart_port *port, unsigned int state,
+	   unsigned int oldstate);
 
 struct plat_sci_reg {
 	u8 offset;
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 787e7cdc5e9c..36a08fd6677f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2931,8 +2931,8 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
 		sci_enable_ms(port);
 }
 
-void sci_pm(struct uart_port *port, unsigned int state,
-		   unsigned int oldstate)
+int sci_pm(struct uart_port *port, unsigned int state,
+	   unsigned int oldstate)
 {
 	struct sci_port *sci_port = to_sci_port(port);
 
@@ -2944,6 +2944,7 @@ void sci_pm(struct uart_port *port, unsigned int state,
 		sci_port_enable(sci_port);
 		break;
 	}
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sci_pm, "SH_SCI");
 
diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
index 092755f35683..571123f58232 100644
--- a/drivers/tty/serial/sprd_serial.c
+++ b/drivers/tty/serial/sprd_serial.c
@@ -900,8 +900,8 @@ static int sprd_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return 0;
 }
 
-static void sprd_pm(struct uart_port *port, unsigned int state,
-		unsigned int oldstate)
+static int sprd_pm(struct uart_port *port, unsigned int state,
+		   unsigned int oldstate)
 {
 	struct sprd_uart_port *sup =
 		container_of(port, struct sprd_uart_port, port);
@@ -914,6 +914,7 @@ static void sprd_pm(struct uart_port *port, unsigned int state,
 		clk_disable_unprepare(sup->clk);
 		break;
 	}
+	return 0;
 }
 
 #ifdef CONFIG_CONSOLE_POLL
diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
index 6ed9a327702b..39404bd94592 100644
--- a/drivers/tty/serial/st-asc.c
+++ b/drivers/tty/serial/st-asc.c
@@ -435,8 +435,8 @@ static void asc_shutdown(struct uart_port *port)
 	free_irq(port->irq, port);
 }
 
-static void asc_pm(struct uart_port *port, unsigned int state,
-		unsigned int oldstate)
+static int asc_pm(struct uart_port *port, unsigned int state,
+		  unsigned int oldstate)
 {
 	struct asc_port *ascport = to_asc_port(port);
 	unsigned long flags;
@@ -459,6 +459,7 @@ static void asc_pm(struct uart_port *port, unsigned int state,
 		clk_disable_unprepare(ascport->clk);
 		break;
 	}
+	return 0;
 }
 
 static void asc_set_termios(struct uart_port *port, struct ktermios *termios,
diff --git a/drivers/tty/serial/stm32-usart.c b/drivers/tty/serial/stm32-usart.c
index ad06b760cfca..a4a93d3911f8 100644
--- a/drivers/tty/serial/stm32-usart.c
+++ b/drivers/tty/serial/stm32-usart.c
@@ -1418,8 +1418,8 @@ stm32_usart_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return -EINVAL;
 }
 
-static void stm32_usart_pm(struct uart_port *port, unsigned int state,
-			   unsigned int oldstate)
+static int stm32_usart_pm(struct uart_port *port, unsigned int state,
+			  unsigned int oldstate)
 {
 	struct stm32_port *stm32port = container_of(port,
 			struct stm32_port, port);
@@ -1438,6 +1438,7 @@ static void stm32_usart_pm(struct uart_port *port, unsigned int state,
 		pm_runtime_put_sync(port->dev);
 		break;
 	}
+	return 0;
 }
 
 #if defined(CONFIG_CONSOLE_POLL)
diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 6240c3d4dfd7..8e2d1d4dc10a 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -412,8 +412,8 @@ static int ulite_verify_port(struct uart_port *port, struct serial_struct *ser)
 	return -EINVAL;
 }
 
-static void ulite_pm(struct uart_port *port, unsigned int state,
-		     unsigned int oldstate)
+static int ulite_pm(struct uart_port *port, unsigned int state,
+		    unsigned int oldstate)
 {
 	int ret;
 
@@ -425,6 +425,7 @@ static void ulite_pm(struct uart_port *port, unsigned int state,
 		pm_runtime_mark_last_busy(port->dev);
 		pm_runtime_put_autosuspend(port->dev);
 	}
+	return 0;
 }
 
 #ifdef CONFIG_CONSOLE_POLL
diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index a072b75dbaf2..c81a57e0c77e 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1231,8 +1231,8 @@ static void cdns_uart_poll_put_char(struct uart_port *port, unsigned char c)
 }
 #endif
 
-static void cdns_uart_pm(struct uart_port *port, unsigned int state,
-		   unsigned int oldstate)
+static int cdns_uart_pm(struct uart_port *port, unsigned int state,
+			unsigned int oldstate)
 {
 	switch (state) {
 	case UART_PM_STATE_OFF:
@@ -1243,6 +1243,7 @@ static void cdns_uart_pm(struct uart_port *port, unsigned int state,
 		pm_runtime_get_sync(port->dev);
 		break;
 	}
+	return 0;
 }
 
 static const struct uart_ops cdns_uart_ops = {

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
