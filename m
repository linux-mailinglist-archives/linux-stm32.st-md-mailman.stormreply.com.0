Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHNJBmK1lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:37:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B17FF14F38A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:37:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50820C87EC6;
	Tue, 17 Feb 2026 18:37:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FFAFC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:37:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HAvjtD850154
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1QmuUCEZrBFNgSu7w6yY93qG
 dfCy2AGpXr9u+0yhsQM=; b=dFB0OLP/P2Zw+1rUZLCk+oVjBbPLZfNVad5hyE30
 3eyHyd594rlb+oaHi0wm3ZIT2iPUdiV/Kn1AzykObKvntO5Et9uTUkDTfMz4YGsC
 hC7sUFSRE5FVE0ZhHQlP1NrT7TD+Y3dBzCGNcMqx5E3eQgKjd3KVh6OHmKN9Pf2n
 tDSkPmxLGeNfuUh5NyYs4pt0AeXPWzQ9DH6SALarPo14S98LmrUqi5xwBlPdEUe8
 k3SRvDf9AAL/7qq5iRt8o4gdOHSeS0V8laEZS+30ov6ggr+YZmoaQHEbA3Tdfhh9
 UhGrYkpQPsoHnT2Fmr8uXt/9Dw2A3TFWtNCav7JwRIgDMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrufuy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:37:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a7b7f04a11so240833005ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353438; x=1771958238;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
 b=LOFh11ATXnzBRqMZmvzyFfAV0cHKndahs2X1wmooGdsODSGRr6T9GnrKcPKTv4N9fx
 jisPpJ2Awx77akAUuQfF8ucYoqwp3mjgOjIDVdNl2/5+TQqdZCCXEaMCe3GfgqLChck8
 abelp+GFL6YBg355f+BBvClxDtOhovNiBXWpCPzMzyqjzwOA5xdLG5JrHdrKuvazvqXS
 G62DYDabbXh94PEXcXwTg8F4JkE/eKD36gOtluxW6J822keHqlBSlVeTZPPdy66b6n7X
 EW59oJ1qwJQbl6i+WEmYmiK0NAueCAddfCBQqND0N++VaPihWCJjDf7zuc0PumFo2Oh2
 jpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353438; x=1771958238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
 b=SE+YpGmgvhD4aoKn/9Sla9sCVwv5CLn9KaU6SsonS5HogK7cE44HLqrrcnKB6dFfUI
 9YJKpu+AIfh76SKJNgnIuVoiyiXsXVyCBZMk0GDBBQH9mgIFQR12nf0odvKdZHbypGAg
 TBe8VQraP2PYzmshwVYoiUuYCJ0hXPedb50YwFfgdK9v/jjzQrQAwv+4I6lNm7f9v0FM
 dbY5WuUVnuxalJp2wka1IhUr8Uu/RDyI/7dhjPR4LZONWIgJgDSUJyibtRJ0Hzf42bT/
 Qy4Uxfbjf234gb+RlkgtKe539xj8wfurkgs779tkMLNvpW0G7EHOTioUUXpiPzpxbBnF
 0FkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtAdtiRrhMenGO2mUjC31isN+J0QQIF1X034bFPH51wjOxZ6+IxKHt2eUPgrkUiau4senfDhuSa3g6wg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxofvIUagVsy5F2+xgHotrD2afviU3rWBxy4OWv8vx/whhQOVgg
 lSM104FQ5GZqPI0ixS83z6A0mEkhCLpodzlYJBtS7w6cd5WyvclSeHosLRVO1V3+lVrPC30iXlb
 lw449G1S9rjO8RZYO71PX2w7qqL6X/ME4/et4qmr+Yu9ygPZD+Pzdzk//aUTBL6ssiXeZhY9v7c
 HXiZSdU7c=
X-Gm-Gg: AZuq6aLb3Oj97nUSCSGYVL7HGMWnTnZw37qaZpdBkQCWnWzJGyaYOPanGbQAQo5zUpv
 JsQ7VLfv3xfsPysf+vqOMqh7HTiPmv4AVqMgOGUuTqXkkIBy8qciYEr4JO40HARuJ1TG/QLGeeI
 eli4XLjLrYL564wyZ0G9TkI0s+tY85BWS8qCvyb3DBI6F+Gh9CzQyFYKZyhCN2lJ8QduiLvPAV9
 9pF3Za6BqBsGmBv8kRawOdn219ZZM9kLQR5qkcO8w4e2JTvR1I5Y1F5ER9vF9/2uJjvoaJ1Cpmm
 Li4o4KPQM1Yuy78X62eGYaQQQt4LK5e6mI5ZDxhLssbW9sfzmdYZmzk8fynJoGogJv41W2YzYar
 D7GZBj5Lzw/oyTtaw5Z0rhE6TcIOAp93iE/4=
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id
 d9443c01a7336-2ab505146femr151882775ad.16.1771353437886; 
 Tue, 17 Feb 2026 10:37:17 -0800 (PST)
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id
 d9443c01a7336-2ab505146femr151882425ad.16.1771353437289; 
 Tue, 17 Feb 2026 10:37:17 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a738220sm110424095ad.37.2026.02.17.10.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:37:16 -0800 (PST)
Date: Wed, 18 Feb 2026 00:07:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS1ViyPMUmk/+IH@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b55e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=PQJxtWgwoR3tQ6wQTWQA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfXzmDCiA++mThD
 MeBQNwdthB4Llq9/H1e/iNquPfpe7PhSLxjcJYjjMFVYFwg17GWw2SxgI8qxkDDQI5s5y+d7u7n
 0iRyoaym1f3Vg5/LoSVttIqSEkwI0jUsUqmbBvfzMuG2vmvV3JtQipMyLGp2uMc2R0UuGC2RmxI
 3Jso9EOjEO65xi9tThn+p0NuG9y0BX8bbZ4m5CTpMCkLPVNIozilkEVwF2LkWpb4fyyorTRxJcI
 SyqYmmbJRdPafynzdPmacKsdU+q0ekZXidsuVcP1ozVfg8GlckMFToq+Si3QqgK61Df+ojHAeIS
 5QJNsYC3227BK/JRmSC6O6DLypMSFuFJ1O2q52dsSAT71/46q7ymnif4r5EUYqSZF3kuAaPBiWV
 O0BysL06AeWfdWMRhj1K98LCtuoyCN3DBKk1HvFOJIIbSg7X2Z754eboUHSjKqkVcgnRd4j+vj2
 H5O4F8hQdP6GApno9Gg==
X-Proofpoint-ORIG-GUID: i4K0CWSedC52LwaF995UrwsygQaW_gQK
X-Proofpoint-GUID: i4K0CWSedC52LwaF995UrwsygQaW_gQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 4/9] net: stmmac:
 qcom-ethqos: move qcom_ethqos_set_sgmii_loopback() up
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,qualcomm.com:email]
X-Rspamd-Queue-Id: B17FF14F38A
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:18:01AM +0000, Russell King (Oracle) wrote:
> ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
> functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
> called from within ethqos_set_func_clk_en(), and checks for
> PHY_INTERFACE_MODE_2500BASEX.
> 
> Move qcom_ethqos_set_sgmii_loopback() to the callers of
> ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
> know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
