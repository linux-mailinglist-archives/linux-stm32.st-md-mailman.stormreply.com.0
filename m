Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DLGYCLFjT2ohfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DF72EA09
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="D/v0rw55";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=QthRIjd1;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 465C5C8F29E;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED6F8C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 06:25:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66960F0a931920
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Jul 2026 06:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=1YqnzWWYNh3cmaUOCZIRd7
 TUov9rA8o7dhqsYSUv9m0=; b=D/v0rw55N+8gvJL2TPFvB6q34PLe7kK4RaJT7w
 WP+mnEBmSOe1UvyzcNS09krx6WOLlf917tXVXnLRrcqAZxP8cRhOA47mW8XnGn1Y
 k8EsYaxNhGsMwsekKBAPgGT4gJlrVctubMoBKyx8sGsn6O5JrKmWfuMdQ9dRswdA
 8M/rOYfeXhKrS/v68WfvkoAcAfdCDSWCvm5SD7xtPdVgnmucXbdeuCqHeUUxIXjI
 bX/2LsSI2Jd0Uri3hT6vNvPCna/B1Qh/GGDh11crLaDF8M4WTbVq0ekjC/ow18Bh
 hndVNiQFktdwwNs0LdMntW5URBp/Fb1Q7fgb8PTSRTYzfNUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsapyp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 06:25:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2caf4173b1cso32692765ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783578333; x=1784183133;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
 b=QthRIjd1fo6z6iTMUZZaseF+/2uCoA2Sn7qM7cAyBo+6yklIcVuaKVkmrkXbzbN0ww
 D7YEv9eNAZGlHT9+wHDiLKIpe+wB3NgBaWz/KzHaSZIa7zbQ6t5zrdMMs9xGdTevh/pH
 YojEswGjUh06w9qQFhp7SOV7yFsl95WQaeezwsSJGGmuBYodx1U2N7h3mLPTTwYTemXn
 CccK2TezCHgrwa5D08BoxnqbVl6DaHSDtq79zIt0+qrtKgq8RvWMPHb+JcUY9YoYm+Dm
 NvjsaeeaMY7iuMd8oRkhfkNPTniVjxgZS8fFd2KSKBhGKUDUI5uGxGx3/5KFTBo1awwM
 Ns4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783578333; x=1784183133;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1YqnzWWYNh3cmaUOCZIRd7TUov9rA8o7dhqsYSUv9m0=;
 b=AUJDCqqm2ICa02CSOz7sAT7j8qaoUbIkl/MeeV240W2sLwwCDQgmQMpSCKm8AjRw8R
 BI52afekRCBkhnuNjQwyTanH9+iMAGrdmkGuF3SLGN5xChmQcLf3+UUfGoIK1z4eePxT
 pS2pfcIyAGjXRIfik6ODGw3JP7mqJdFt/zDXeeHSM3PcSbwgmJFx7BvPOFkIR+KYUqtm
 Bq5u/Sv9NxbxO6jmPEesoVL3S3lxeQ1VNFrYLDu0667OtLnRQICGVkJ/fl+pSr5S2VOT
 RLi0jgp2GAB5bCt0pAqI/eNNB1ueZBzMJDuwuX8sfSgmXIsfD6VTdG2Nsz1+vSyT8EiN
 WU/A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1+y0N90bFJ9gjwwd2ENoIjtoRPyt+MCq1sLqlHpH2h94GbmHrQd4RCNZM5jZfV8YEmVLKvfoow6OpDw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYS9LaflPLN5UvZbQyqELWDL1fzxk/QFcdaGrmrYTeLswQkF2O
 vTgxRln2Uys5weyd6NMaEB7eK9eo6RMf3uMwdnxU/3P/S2XhQ9MfwsYvlaoZQ6DeSQGYuSW4QcE
 5OcVSiVEBOx44N2txvGNzIt6+30PC0kOcUj1HJ4yF5kVMrBxoItFN2vIww4ft3J13enyix/eRRc
 90mC67fPo=
X-Gm-Gg: AfdE7cmtKaMbhAoHD6NebS1SFuYIL3kNwfX4FUF61zJr1Jr0cmUqH6Cj/UlcbxduSji
 SY1SGVHafYnlbJWv3beUdIIk2Y8MrSNMSyw3tLF1CZIBl4nib65JrIeP8wd+MlrbwX2YdVKzzhl
 H5cdRPgw4NC5P2QfwQEWt0Xgey4BbEVNhBNRWlp1Q2JD+Rn+3CSgZxBF57kW1X722vTRPEq4tfa
 0SpPKaka7H7Ey1XiTFSUD8GpOAWcYRylLrBMqZsqAm1t4QbuZBjpjIUvHWsC72Dlipj2g7t+VZl
 ZmxJ9tYmS6BbyJP3Z/DwOxtNSq5LaZcDSmCc55sMnee6H/NoEbTopPPqfYUubXddnJ04lY7WXUI
 d/zY7nJZGYDysbBHENdsmkiDOn2JkezyqdUxIe6WHORsw
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id
 d9443c01a7336-2ccea2a571fmr63676615ad.7.1783578333362; 
 Wed, 08 Jul 2026 23:25:33 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2c6:f3ae:2386 with SMTP id
 d9443c01a7336-2ccea2a571fmr63676155ad.7.1783578332723; 
 Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 23:25:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:12 +0530
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMg+T2oC/yWNUQrCMBAFr1L220BMaQSvIrKkm42NYlo2iQild
 2+0nwPz5q2QWSJnuHYrCH9ijnNqcD51QJNLD1bRNwajjdUXbZXzHoVLlYQ0Mb0wzILVScHDx+W
 tvKGxt0PbhB5aaREO8ft/ud0PznV8MpVfGrZtB+rg+KeHAAAA
X-Change-ID: 20260706-add_return_check_for_uart_change_pm-d2cb365202f3
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=4632;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=xaM/hVUjZo3snEyz/S9bcZ/H9ysyVZEXqq3xmE7nNZU=;
 b=xstS7B9zPIQfwsEBA4/XFGTcfAsU4oB4GSGJzY7XzF/v3xKj/L2hg5jibSJ09Rtcp/Zvw7q/a
 rKqBeBXhUaoCx0C8rUDinlyefoUSLITLDPzV1Kykv7lFa1T2iyWiUtz
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX0w9TNHEqlBcL
 5mWkDCQu9J0HOhjgGXAu0LtRFnEgRIfcJJEHhGkmOEFTDDAv0de/W8aTrt9B+uT8vVtCo2Mwqlk
 PQQMDsK0t0sZMKIqr3o39svyr0TnrIg=
X-Proofpoint-GUID: geXA-m3E_wYd2eFEP1LzYdcRszP41bBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfXy4oWpcGMzl/P
 yYOzpVa4racV6neQGaavuN2FQD0rHorC1b43Uk11o0gGYsCyD0Zx9REmgpRifBbPVg74x3jgM5P
 ThXg1eJZYjb8td1g1JUVLGPCCfZSGskO2mOKpLg8nfFnkPvE9A1kaTBXCQbuz4wQhx38QOq6f/t
 zfoJQuOpipl+Mt/L5TeBTHY8MoonaejSAqrWBxxBQUL1oKF3jf1himFkpCzfpfAJFan7oBdFN5o
 1iilhDqV649H6tvcQiP0JdNMByCLQFu8HBmYSuxRUVeri2IXewXjM7l/diCw5t50kmAWjP5y1mV
 Fsp8oGYErB3W+oBROa6kVZIt95jeixDJSGXoXUhfjZzM0R6gUimcpNDn5oPmRPgTHN3EGYo4KZX
 I9MwfJWA7pQ8p46Ql/DbDHsZNOuZuhWd5vdB3DbJ7DfL9Z014To3uzWR1fm+06yKpLyXdsTIbfs
 5I23/FPtaFLC3uFM0DA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f3ede cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Sp74d_8yOxMrUkFL1bcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: geXA-m3E_wYd2eFEP1LzYdcRszP41bBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: linux-samsung-soc@vger.kernel.org, aniket.randive@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Praveen Talari <praveen.talari@oss.qualcomm.com>,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:chand
 ana.chiluveru@oss.qualcomm.com,m:linux-mediatek@lists.infradead.org,m:linux-serial@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uart_ops.pm:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 933DF72EA09

VGhlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIGhhcyBiZWVuIGRlY2xhcmVkIHZvaWQgc2luY2UgaXRz
IGludHJvZHVjdGlvbiwKd2hpY2ggbWVhbnMgYW55IGVycm9yIGZyb20gYSBkcml2ZXIncyBwb3dl
ciBtYW5hZ2VtZW50IGltcGxlbWVudGF0aW9uIGlzCnNpbGVudGx5IGRpc2NhcmRlZCBieSB1YXJ0
X2NoYW5nZV9wbSgpLiBCZXlvbmQgbG9zaW5nIHRoZSBlcnJvcgppbmZvcm1hdGlvbiwgdWFydF9j
aGFuZ2VfcG0oKSB1bmNvbmRpdGlvbmFsbHkgdXBkYXRlcyBzdGF0ZS0+cG1fc3RhdGUKZXZlbiB3
aGVuIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlIHRyYW5zaXRpb24gZmFpbGVkLiBUaGlzIGNhdXNl
cyB0aGUKc2VyaWFsIGNvcmUgdG8gdHJhY2sgYSBwb3dlciBzdGF0ZSB0aGF0IGRvZXMgbm90IHJl
ZmxlY3QgcmVhbGl0eToKc3Vic2VxdWVudCBjYWxscyB0byB1YXJ0X2NoYW5nZV9wbSgpIHNlZSB0
aGUgc3RhbGUgY2FjaGVkIHN0YXRlIGFzCm1hdGNoaW5nIHRoZSByZXF1ZXN0ZWQgc3RhdGUgYW5k
IHNraXAgdGhlIGNhbGxiYWNrIGVudGlyZWx5LCBsZWF2aW5nIHRoZQpoYXJkd2FyZSBwZXJtYW5l
bnRseSBzdHVjayB3aXRoIG5vIGZ1cnRoZXIgcmVjb3ZlcnkgYXR0ZW1wdC4KCk9uIG1vZGVybiBw
bGF0Zm9ybXMgd2hlcmUgdGhlIC5wbSBjYWxsYmFjayBwZXJmb3JtcyByZWFsIHdvcmsg4oCUCmVu
YWJsaW5nIGNsb2NrIHRyZWVzLCBpbnRlcmFjdGluZyB3aXRoIHJ1bnRpbWUgUE0sIGFzc2VydGlu
ZyB2b2x0YWdlCnJlZ3VsYXRvcnMg4oCUIHRoaXMgaXMgYSBjb3JyZWN0bmVzcyBnYXAuIEZhaWx1
cmVzIGFyZSBpbnZpc2libGUgdG8gdGhlClBNIGZyYW1ld29yaywgdGhlIHBvcnQgcHJvY2VlZHMg
dG8gY2FsbCBvcHMtPnN0YXJ0dXAoKSBvbiBwb3RlbnRpYWxseQp1bnBvd2VyZWQgaGFyZHdhcmUs
IGFuZCBzdXNwZW5kL3Jlc3VtZSBlcnJvcnMgYXJlIGhpZGRlbiBmcm9tIHRoZSBjb3JlCnRoYXQg
bmVlZHMgdG8gaGFuZGxlIHRoZW0uCgpUaGlzIHNlcmllcyBmaXhlcyB0aGUgcHJvYmxlbSBpbiBm
b3VyIHN0ZXBzOgoKICBQYXRjaCAxIGNoYW5nZXMgdGhlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIHNp
Z25hdHVyZSBmcm9tIHZvaWQgdG8gaW50LAogIHVwZGF0ZXMgdWFydF9jaGFuZ2VfcG0oKSB0byBw
cm9wYWdhdGUgZXJyb3JzIGFuZCBvbmx5IGNvbW1pdAogIHN0YXRlLT5wbV9zdGF0ZSBvbiBzdWNj
ZXNzLCBhbmQgaGFuZGxlcyB0aGUgcmV0dXJuIHZhbHVlIGF0IGV2ZXJ5CiAgY2FsbCBzaXRlIGlu
IHNlcmlhbF9jb3JlLmMgd2l0aCBhcHByb3ByaWF0ZSBwb2xpY3kgcGVyIGNvbnRleHQKICAocHJv
cGFnYXRlLCBsb2csIG9yIHNraXAtb24tZmFpbHVyZSkuCgogIFBhdGNoIDIgdXBkYXRlcyB0aGUg
ODI1MCBkcml2ZXIgZmFtaWx5OiBzZXJpYWw4MjUwX2RvX3BtKCkgYW5kCiAgc2VyaWFsODI1MF9w
bSgpIGFyZSB1cGRhdGVkIHRvIHJldHVybiBpbnQgKHdpdGggdGhlIGV4cG9ydGVkIHN5bWJvbAog
IGRlY2xhcmF0aW9uIHVwZGF0ZWQgaW4gc2VyaWFsXzgyNTAuaCksIGFuZCB0aGUgODI1MCBzdWIt
ZHJpdmVyCiAgcG0gY2FsbGJhY2tzIGFyZSB1cGRhdGVkIHRvIHJldHVybiAwLgoKICBQYXRjaCAz
IHVwZGF0ZXMgdGhlIHJlbWFpbmluZyBub24tODI1MCBzZXJpYWwgZHJpdmVycy4gQWxsIC5wbQog
IGltcGxlbWVudGF0aW9ucyBhcmUgdXBkYXRlZCB0byByZXR1cm4gMC4gVGhlIHNoLXNjaSBmb3J3
YXJkCiAgZGVjbGFyYXRpb24gc2hhcmVkIHdpdGggcnNjaSBpcyBhbHNvIHVwZGF0ZWQuCgogIFBh
dGNoIDQgdXBkYXRlcyBhcmNoLWxldmVsIGltcGxlbWVudGF0aW9uczogU0ExMTAwIChhc3NhYmV0
LCBoM3h4eCksCiAgT01BUDEvYW1zLWRlbHRhIChtb2RlbV9wbSwgbm93IHByb3BhZ2F0ZXMgcmVn
dWxhdG9yIGVycm9ycyksIGFuZAogIE1JUFMvQWxjaGVteSAoYWxjaGVteV84MjUwX3BtKS4KCkFs
bCBleGlzdGluZyAucG0gaW1wbGVtZW50YXRpb25zIHJldHVybiAwLCBzbyB0aGVyZSBpcyBubyBm
dW5jdGlvbmFsCmNoYW5nZSBmb3IgYW55IGN1cnJlbnQgZHJpdmVyLiBUaGUgc2VyaWVzIHB1cmVs
eSBhZGRzIHRoZSBpbmZyYXN0cnVjdHVyZQpmb3IgZHJpdmVycyB0byByZXBvcnQgZXJyb3JzIGdv
aW5nIGZvcndhcmQsIHdpdGggdGhlIHNlcmlhbCBjb3JlIHJlYWR5CnRvIGhhbmRsZSB0aGVtIGNv
cnJlY3RseS4KClNpZ25lZC1vZmYtYnk6IFByYXZlZW4gVGFsYXJpIDxwcmF2ZWVuLnRhbGFyaUBv
c3MucXVhbGNvbW0uY29tPgotLS0KUHJhdmVlbiBUYWxhcmkgKDYpOgogICAgICB0dHk6IHNlcmlh
bDogY2hhbmdlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIHRvIHJldHVybiBpbnQKICAgICAgc2VyaWFs
OiA4MjUwOiB1cGRhdGUgLnBtIGNhbGxiYWNrcyB0byByZXR1cm4gaW50CiAgICAgIHR0eTogc2Vy
aWFsOiB1cGRhdGUgLnBtIGNhbGxiYWNrcyB0byByZXR1cm4gaW50CiAgICAgIGFyY2g6IHVwZGF0
ZSB1YXJ0IHBtIGNhbGxiYWNrcyB0byByZXR1cm4gaW50CiAgICAgIHR0eTogc2VyaWFsOiBwcm9w
YWdhdGUgdWFydF9jb25maWd1cmVfcG9ydCBmYWlsdXJlIHRvIHVhcnRfYWRkX29uZV9wb3J0CiAg
ICAgIHNlcmlhbDogcWNvbS1nZW5pOiBjaGVjayByZXR1cm4gdmFsdWUgb2YgcG1fcnVudGltZV9y
ZXN1bWVfYW5kX2dldCgpCgogYXJjaC9hcm0vbWFjaC1vbWFwMS9ib2FyZC1hbXMtZGVsdGEuYyAg
ICAgICB8ICAxMCArLS0KIGFyY2gvYXJtL21hY2gtc2ExMTAwL2Fzc2FiZXQuYyAgICAgICAgICAg
ICAgfCAgIDMgKy0KIGFyY2gvYXJtL21hY2gtc2ExMTAwL2gzeHh4LmMgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIGFyY2gvbWlwcy9hbGNoZW15L2NvbW1vbi9wbGF0Zm9ybS5jICAgICAgICAgfCAg
IDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYyAgICAgICAgICAgfCAgIDMg
Ky0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZXhhci5jICAgICAgICAgfCAgIDQgKy0K
IGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfbXRrLmMgICAgICAgICAgfCAgIDQgKy0KIGRy
aXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfb21hcC5jICAgICAgICAgfCAgIDYgKy0KIGRyaXZl
cnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfcG9ydC5jICAgICAgICAgfCAgIDkgKystCiBkcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX3B4YS5jICAgICAgICAgIHwgICA2ICstCiBkcml2ZXJzL3R0
eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL3R0eS9z
ZXJpYWwvZnNsX2xwdWFydC5jICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL3R0eS9zZXJp
YWwvbXNtX3NlcmlhbC5jICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL3R0eS9zZXJpYWwv
b21hcC1zZXJpYWwuYyAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL3R0eS9zZXJpYWwvcHhh
LmMgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL3R0eS9zZXJpYWwvcWNvbV9n
ZW5pX3NlcmlhbC5jICAgICAgIHwgIDE2ICsrKy0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2Ftc3Vu
Z190dHkuYyAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2MxNmlzN3h4
LmMgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUu
YyAgICAgICAgICAgIHwgMTA0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGRyaXZlcnMv
dHR5L3NlcmlhbC9zZXJpYWxfdHh4OS5jICAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvdHR5
L3NlcmlhbC9zaC1zY2ktY29tbW9uLmggICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvdHR5L3Nl
cmlhbC9zaC1zY2kuYyAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC9zcHJkX3NlcmlhbC5jICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC9z
dC1hc2MuYyAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC91YXJ0bGl0
ZS5jICAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMvdHR5L3NlcmlhbC94aWxpbnhfdWFy
dHBzLmMgICAgICAgICAgfCAgIDUgKy0KIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9zYTEx
eDAtc2VyaWFsLmggfCAgIDIgKy0KIGluY2x1ZGUvbGludXgvc2VyaWFsXzgyNTAuaCAgICAgICAg
ICAgICAgICAgfCAgIDYgKy0KIGluY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaCAgICAgICAgICAg
ICAgICAgfCAgMTAgKy0tCiAzMCBmaWxlcyBjaGFuZ2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgODYg
ZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogOGNkZWFhNTBlYWU4ZGFkMzQ4ODU1MTVmNjI1
NTllZTgzZTdlOGRkYQpjaGFuZ2UtaWQ6IDIwMjYwNzA2LWFkZF9yZXR1cm5fY2hlY2tfZm9yX3Vh
cnRfY2hhbmdlX3BtLWQyY2IzNjUyMDJmMwoKQmVzdCByZWdhcmRzLAotLSAgClByYXZlZW4gVGFs
YXJpIDxwcmF2ZWVuLnRhbGFyaUBvc3MucXVhbGNvbW0uY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
